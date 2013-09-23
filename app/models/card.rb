class Card < ActiveRecord::Base
  belongs_to :player
  belongs_to :country
end
