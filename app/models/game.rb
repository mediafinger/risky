class Game < ActiveRecord::Base
  has_many :armies
  has_many :cards
  has_many :countries
  has_many :players
  has_many :regions
  has_many :rounds

  after_create :copy_regions
  after_create :copy_countries

  def add_players(players)
    rank = 1
    players.shuffle.each do |player|
      player.update_attributes!(game_id: self.id, rank: rank)
      rank += 1
    end
  end

  def distribute_countries
    return if self.players.count < 2

    Notificator.put "Placing Armies on Map ..."
    countries = Country.all.to_a.shuffle
    x = 0

    while x < countries.length - 1 do
      self.players.each do |player|
        countries[x].update_attributes!(player_id: player.id)
        Army.create!(game: self, player: player, country: countries[x], size: 1)

        x += 1
        break if x >= countries.length
      end
    end
  end

  def create_cards()
    Card.create_set(self.id)
  end

  def end_game
    self.armies.destroy
    self.cards.destroy
    self.countries.destroy
    self.regions.destroy
    self.rounds.destroy

    self.players.each do |player|
      player.update_attributes!(game_id: nil, rank: nil)
    end
  end


private

  def copy_regions
    regions = Region.where(game_id: nil).to_a

    regions.each do |region|
      game_region = region.dup
      game_region.update_attributes!(game_id: self.id)
    end
  end

  def copy_countries
    countries = Country.where(game_id: nil).to_a

    countries.each do |country|
      game_country = country.dup
      game_country.update_attributes!(game_id: self.id)
    end
  end

end
