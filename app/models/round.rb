class Round < ActiveRecord::Base
  belongs_to :game

  scope :part_of,      lambda { |game|   where(game_id:    game.id) }
end
