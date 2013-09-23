class Neighbour < ActiveRecord::Base
  has_and_belongs_to_many :countries

  # Just for debugging
  def countries
    [Country.where(id: country_id).first.name, Country.where(id: neighbour_id).first.name]
  end
end
