class Army < ActiveRecord::Base
  belongs_to :player
  belongs_to :country

  validates :size, numericality: { only_integer: true, greater_than: 0 }
end
