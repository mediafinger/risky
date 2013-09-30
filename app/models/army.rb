class CanNotMoveTroopsToEnemyException < StandardError
end

class NoBorderException < StandardError
end

class NotEnoughTroopsException < StandardError
end

class Army < ActiveRecord::Base
  belongs_to :game
  belongs_to :country
  belongs_to :player

  validates :size, numericality: { only_integer: true, greater_than: 0 }

  scope :part_of,      lambda { |game|   where(game_id:    game.id) }
  scope :belonging_to, lambda { |player| where(player_id:  player.id) }

  def add_one
    if player.pool > 0
      Player.transaction do
        player.update_attributes!(pool: player.pool - 1)
        self.update_attributes!(size: self.size + 1)
      end
    end
  end

  def move_to(other_country, troops)
    raise NotEnoughTroopsException          unless self.size > troops
    raise NoBorderException                 unless self.country.countries.include?(other_country)
    raise CanNotMoveTroopsToEnemyException  unless self.player == other_country.player

    Army.transaction do
      self.reload.update_attributes!(size: self.size - troops)
      other_country.army.update_attributes!(size: other_country.army.size + troops)
    end
  end
end
