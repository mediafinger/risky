class Region < ActiveRecord::Base
  belongs_to :game
  belongs_to :player

  has_many :countries

  scope :part_of,      lambda { |game|   where(game_id:    game.id) }
  scope :belonging_to, lambda { |player| where(player_id:  player.id) }

end
