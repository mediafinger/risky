class Player < ActiveRecord::Base
  belongs_to :game
  has_many :armies, dependent: :destroy
  has_many :cards
  has_many :countries
  has_many :regions

  scope :part_of,      lambda { |game|   where(game_id:    game.id) }

  def lost?
    countries.length < 1
  end
end
