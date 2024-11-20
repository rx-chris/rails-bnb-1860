class Amenity < ApplicationRecord
  has_many :accommodation_amenities, dependent: :destroy
  has_many :accomodations, through: :accommodation_amenities

  NAMES = ["Wi-Fi", "Air Conditioning", "Heating", "Kitchen", "Free Parking", "Towels", "Bed Linens", "Soap", "Toilet Paper", "Television", "Washer", "Dryer", "Hair Dryer", "Iron", "Coffee Maker", "Tea Kettle", "Smoke Alarm", "Carbon Monoxide Detector", "First Aid Kit", "Fire Extinguisher"];

  validates :name, presence: true, inclusion: { in: NAMES }
end

# wifi = Amenity.create!(name: 'Wi-Fi')
# aircon = Amenity.create!(name: 'Air Conditioning')
# heating = Amenity.create!(name: 'Heating')
# kitchen = Amenity.create!(name: 'Kitchen')

# @accommodation = Accommodation.first

# @accommodation.amenities << wifi
# @accommodation.amenities << heating
