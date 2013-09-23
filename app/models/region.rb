class Region < ActiveRecord::Base
  belongs_to :player

  has_many :countries
end
