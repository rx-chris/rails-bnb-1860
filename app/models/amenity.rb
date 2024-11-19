class Amenity < ApplicationRecord
  has_many :accommodation_amenities, dependent: :destroy
  has_many :accomodations, through: :accommodation_amenities

  AMENITIES = ["Wi-Fi", "Air Conditioning", "Heating", "Kitchen", "Free Parking", "Towels", "Bed Linens", "Soap", "Toilet Paper", "Television", "Washer", "Dryer", "Hair Dryer", "Iron", "Coffee Maker", "Tea Kettle", "Smoke Alarm", "Carbon Monoxide Detector", "First Aid Kit", "Fire Extinguisher"];

  validates :name, presence: true, inclusion: { in: AMENITIES }
end
