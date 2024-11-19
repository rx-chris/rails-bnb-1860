class Amenity < ApplicationRecord
  has_many :accommodation_amenities, dependent: :destroy
  has_many :accomodations, through: :accommodation_amenities
end
