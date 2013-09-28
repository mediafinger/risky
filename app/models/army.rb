class Army < ActiveRecord::Base
  belongs_to :game
  belongs_to :country
  belongs_to :player

  validates :size, numericality: { only_integer: true, greater_than: 0 }

  scope :part_of,      lambda { |game|   where(game_id:    game.id) }
  scope :belonging_to, lambda { |player| where(player_id:  player.id) }

end
