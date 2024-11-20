require 'faker'

# clear all tables
User.destroy_all
Amenity.destroy_all
Booking.destroy_all
Accommodation.destroy_all
AccommodationAmenity.destroy_all
Review.destroy_all

puts 'Cleared all tables'

# create users
USERNAMES = [
  'Belle_Dejesus',
  'Rio_Burton',
  'Miriam_Hester',
  'Rene_Singh',
  'Vivienne_Owen',
  'Cannon_Valencia',
  'Maddison_Roman',
  'Kian_Flores',
  'Emilia_Vega',
  'Aidan_Fitzgerald',
]
PASSWORD = "password1860"

USERNAMES.each do |username|
  User.create!(
    email: "#{username}@gmail.com",
    password: PASSWORD
  )
end

puts "Created #{User.all.length} users"

# create amenities
["Wi-Fi", "Air Conditioning", "Heating", "Kitchen", "Free Parking", "Towels", "Bed Linens", "Soap", "Toilet Paper", "Television", "Washer", "Dryer", "Hair Dryer", "Iron", "Coffee Maker", "Tea Kettle", "Smoke Alarm", "Carbon Monoxide Detector", "First Aid Kit", "Fire Extinguisher"].each do |name|
  Amenity.create!(name: name)
end

puts "Created #{Amenity.all.length} Amenities"

# create accomodations
30.times do |i|
  Accommodation.create!(
    type_of_place: Accommodation::TYPES_OF_PLACE.sample,
    price: rand(100..500),
    rating: rand(0..5),
    address: Faker::Address.full_address,
    bed_count: rand(0..5),
    bedroom_count: rand(0..5),
    bathroom_count: rand(0..5),
    user: User.all.sample
  )
end

puts "Created #{Accommodation.all.length} accomodation"

# create bookings
20.times do |i|
  start_date = Date.today + rand(2..5)
  end_date = start_date + rand(3..10)
  Booking.create!(
    start_date: start_date,
    end_date: end_date,
    guest_count: rand(1..7),
    status: Booking::STATUSES.sample,
    user: User.all.sample,
    accommodation: Accommodation.all.sample
  )
end

puts "Created #{Booking.all.length} bookings"

# create accommodation amenities
120.times do |i|
  accommodation = Accommodation.all.sample
  filtered_amenities = Amenity.all.reject do |amenity|
    accommodation.amenities.find { |accom_amenity| accom_amenity.id == amenity.id }
  end

  a = AccommodationAmenity.new(
    accommodation: accommodation,
    amenity: filtered_amenities.sample
  )
  a.save!
end

# create reviews
40.times do |i|
  Review.create!(
    content: Faker::Restaurant.review,
    rating: rand(1..5),
    accommodation: Accommodation.all.sample,
    user: User.all.sample
  )
end

puts "Created #{Review.all.length} reviews"
