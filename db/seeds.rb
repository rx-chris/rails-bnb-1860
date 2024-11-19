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

users = User.all
puts "Created #{users.length} users"

# create amenities
Amenity::NAMES.each do |name|
  Amenity.create!(name: name)
end

amenities = Amenity.all
puts "Created #{amenities.length} Amenities"

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
    user: users.sample
  )
end

accommodations = Accommodation.all
puts "Created #{accommodations.length} accomodation"

# create bookings
today = Date.today

20.times do |i|
  days_after_today = rand(2..5)
  start_date = today + rand(2..5)
  end_date = start_date + rand(3..10)
  Booking.create!(
    start_date: start_date,
    end_date: end_date,
    guest_count: rand(1..7),
    status: Booking::STATUSES.sample,
    user: users.sample,
    accommodation: accommodations.sample
  )
end

bookings = Booking.all
puts "Created #{bookings.length} bookings"

# reviews
40.times do |i|
  Review.create!(
    content: Faker::Restaurant.review,
    rating: rand(1..5),
    accommodation: accommodations.sample,
    user: users.sample
  )
end

reviews = Review.all
puts "Created #{reviews.length} reviews"
