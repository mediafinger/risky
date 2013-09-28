class Card < ActiveRecord::Base
  belongs_to :country
  belongs_to :player
  belongs_to :game

  NAMES = [:Artillery, :Cavalery, :Infantry]

  scope :part_of,      lambda { |game|   where(game_id:    game.id) }
  scope :belonging_to, lambda { |player| where(player_id:  player.id) }


  def self.create_set(game_id)
    Notificator.put "Creating Cards ..."
    countries = Country.all.to_a.shuffle

    for x in 0..countries.length - 1
      Card.create!(country: countries[x], bonus: 2, name: get_name(x), game_id: game_id)
      x += 1
    end
  end

  def self.get_name(x)
    if x%3 == 0
      return NAMES[2]
    elsif x%2 == 0
      return NAMES[1]
    else
      return NAMES[0]
    end
  end

end
