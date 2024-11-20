class Amenity < ApplicationRecord
  has_many :accommodation_amenities, dependent: :destroy
  has_many :accommodations, through: :accommodation_amenities

  validates :name, presence: true, uniqueness: true
end


# @accommodation = Accommodation.first

# @accommodation.amenities << wifi
# @accommodation.amenities << heating

# wifi = Amenity.create!(name: 'Wi-Fi')
# aircon = Amenity.create!(name: 'Air Conditioning')
# heating = Amenity.create!(name: 'Heating')
# kitchen = Amenity.create!(name: 'Kitchen')
# free_parking = Amenity.create!(name: 'Free Parking')
# towels = Amenity.create!(name: 'Bed Linens')
# soap = Amenity.create!(name: 'Soap')
# toilet_paper = Amenity.create!(name: 'Toilet Paper')
# television = Amenity.create!(name: 'Television')
# washer = Amenity.create!(name: 'Washer')
# dryer = Amenity.create!(name: 'Dryer'),
# hair_dryer = Amenity.create!(name: 'Hair Dryer')
# iron = Amenity.create!(name: 'Iron')
# coffee_maker = Amenity.create!(name: 'Coffee Maker')
# tea_kettle = Amenity.create!(name: 'Tea Kettle')
# smoke_alarm = Amenity.create!(name: 'Smoke Alarm')
# carbon_monoxide_detector = Amenity.create!(name: 'Carbon Monoxide Detector')
# first_aid = Amenity.create!(name: 'First Aid Kit')
# fire_extinguisher = Amenity.create!(name: 'Fire Extinguisher')
