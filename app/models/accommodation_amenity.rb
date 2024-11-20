class AccommodationAmenity < ApplicationRecord
  belongs_to :amenity
  belongs_to :accommodation
  validates :accommodation, uniqueness: { scope: :amenity,
  message: "each accommodation should have unique amenities" }
end
