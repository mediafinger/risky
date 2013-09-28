class Country < ActiveRecord::Base
  belongs_to :player
  belongs_to :region

  has_one :card
  has_one :army

  has_and_belongs_to_many :countries, foreign_key: "neighbour_id"

  def dices
    @dices
  end

  # always use a sorted (desc) array with 2 elements
  def dices=(arr)
    @dices = ((arr + [0,0,0]).sort.reverse)[0..1]
  end

  def neighbours
    countries.pluck(:name)
  end

end
