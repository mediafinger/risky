class Army < ActiveRecord::Base
  belongs_to :game
  belongs_to :country
  belongs_to :player

  validates :size, numericality: { only_integer: true, greater_than: 0 }

  scope :part_of,      lambda { |game|   where(game_id:    game.id) }
  scope :belonging_to, lambda { |player| where(player_id:  player.id) }

  def add_one
    if player.pool > 0
      player.update_attributes!(pool: player.pool - 1)
      self.update_attributes!(size: self.size + 1)
    end
  end

  def move_to(other_country, troops)
    #TODO
  end
end
