class AccommodationAmenity < ApplicationRecord
  belongs_to :amenity
  belongs_to :accommodation
end
