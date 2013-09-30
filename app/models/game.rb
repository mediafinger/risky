class Game < ActiveRecord::Base
  has_many :armies
  has_many :cards
  has_many :countries
  has_many :players
  has_many :regions

  after_create :copy_regions
  after_create :create_cards

  def current_player
    self.players.where(active: true).first
  end

  def add_players(players)
    rank = 1
    players.shuffle.each do |player|
      if rank == 1
        player.update_attributes!(game_id: self.id, rank: rank, active: true)
      else
        player.update_attributes!(game_id: self.id, rank: rank, active: false)
      end
      rank += 1
    end

    self
  end

  def distribute_countries
    return if self.players.count < 2

    Notificator.put "Placing Armies on Map ..."
    countries = Country.all.to_a.shuffle
    x = 0

    while x < countries.length - 1 do
      self.players.each do |player|
        countries[x].update_attributes!(player_id: player.id)
        Army.create!(game: self, player: player, country: countries[x], size: rand(1..5))
        countries[x].region.change_owner(player)

        x += 1
        break if x >= countries.length
      end
    end

    current_player.update_attributes!(pool: troops_per_turn)
    self
  end

  # TODO add check if game is finished
  # TODO add check for players without countries
  def next_player
    number_of_players = self.players.length
    turn = current_player.rank

    if turn == number_of_players
      current_player.update_attributes!(active: false) &&
        self.players.where(rank: 1).first.update_attributes!(active: true)
    else
      current_player.update_attributes!(active: false) &&
        self.players.where(rank: turn + 1).first.update_attributes!(active: true)
    end

    current_player.update_attributes!(pool: troops_per_turn)
  end

  def end_game
    self.armies.destroy
    self.cards.destroy
    self.countries.destroy
    self.regions.destroy

    self.players.each do |player|
      player.update_attributes!(game_id: nil, rank: nil, active: false)
    end

    self.destroy
  end


private

  def copy_regions
    regions = Region.where(game_id: nil).to_a

    regions.each do |region|
      game_region = region.dup
      game_region.update_attributes!(game_id: self.id)

      copy_countries(region, game_region)
    end

    set_neighbours
  end

  def copy_countries(region, game_region)
    countries = Country.where(game_id: nil, region_id: region.id).to_a

    countries.each do |country|
      game_country = country.dup
      game_country.update_attributes!(game_id: self.id, region_id: game_region.id)
    end
  end

  def set_neighbours
    self.countries.each do |country|
      neigbour_names = Country.where(game_id: nil, name: country.name).first.countries.pluck(:name)

      neigbour_names.each do |neighbour|
        country.countries << [self.countries.where(name: neighbour).first]
      end
    end
  end

  def create_cards()
    Card.create_set(self.id)
  end

  def troops_per_turn
    [(current_player.countries.part_of(self).length / 3).floor, 3].max + region_bonus
  end

  def region_bonus
    bonus = 0
    self.regions.each do |region|
      bonus += region.bonus_for(current_player)
    end

    bonus
  end
end
