class Country < ActiveRecord::Base
  belongs_to :player
  belongs_to :region

  has_one :card
  has_one :army

  has_many :neighbours,   class_name: "Country", foreign_key: "neighbour_id"
  belongs_to :neighbours, class_name: "Country"


  def neighbours
    neighbour_ids = Neighbour.where(country_id: self.id).pluck(:neighbour_id)
    neighbour_names = []

    neighbour_ids.each do |id|
      neighbour_names << Country.where(id: id).first.name
    end

    neighbour_names
  end

end
