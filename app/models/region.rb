class Region < ActiveRecord::Base
  belongs_to :game
  belongs_to :player

  has_many :countries

  scope :part_of,      lambda { |game|   where(game_id:    game.id) }
  scope :belonging_to, lambda { |player| where(player_id:  player.id) }

  def change_owner(player)
    return false unless self.fully_occupied?

    self.update_attributes!(player_id: player.id)
  end

  def fully_occupied?
    self.countries.pluck(:player_id).uniq.length == 1
  end

  def bonus_for(player)
    if fully_occupied? && player == self.player
      self.bonus
    else
      0
    end
  end

end
