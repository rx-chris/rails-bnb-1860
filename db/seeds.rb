require 'faker'

# clear all tables
User.destroy_all
Amenity.destroy_all
Review.destroy_all # moved review up to destroy before booking
Booking.destroy_all
Accommodation.destroy_all
AccommodationAmenity.destroy_all

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
  first_name, last_name = username.split("_")
  User.create!(
    email: "#{username}@gmail.com",
    password: PASSWORD,
    first_name:,
    last_name:
  )
end

puts "Created #{User.all.length} users"

# create amenities
["Wi-Fi", "Air Conditioning", "Heating", "Kitchen", "Free Parking", "Towels", "Bed Linens", "Soap", "Toilet Paper", "Television", "Washer", "Dryer", "Hair Dryer", "Iron", "Coffee Maker", "Tea Kettle", "Smoke Alarm", "Carbon Monoxide Detector", "First Aid Kit", "Fire Extinguisher"].each do |name|
  Amenity.create!(name: name)
end

puts "Created #{Amenity.all.length} amenities"

# create accomodations
ACCOMMODATION_TITLES = [
  'Seaside Serenity',
  'Tranquil Haven',
  'Blissful Retreat',
  'Ocean Breeze Cottage',
  'Evergreen Escape',
  'Sunnyvale Lodge',
  'Whispering Pines',
  'Dreamcatcher Lodge',
  'Sunset View Villa',
  'Cozy Cove',
  'Lakeside Hideaway',
  'The Happy Nest',
  'Starry Skies Cabin',
  'Rustic Charm Lodge',
  'The Wanderlust Retreat',
  'Mountain Peak Lodge',
  'Paradise Point',
  'The Charmed Cabin',
  'Nature’s Nook',
  'The Relaxation Station',
  'Serendipity Shores',
  'The Enchanted Cottage',
  'Blissful Beach House',
  'The Cozy Getaway',
  'Cloud Nine Retreat',
  'The Joyful Journey',
  'The Dreamy Dune',
  'Harbor Haven',
  'The Welcoming Window',
  'Timeless Tranquility',
  'The Happy Harbor',
  'Sandy Toes Retreat',
  'The Golden Sunset',
  'The Whimsical Oasis',
  'The Peaceful Perch',
  'Meadowview Cottage',
  'The Blissful Bungalow',
  'Sunflower Sanctuary',
  'The Solitude Sanctuary',
  'The Lush Escap'
]

ACCOMMODATION_TITLES.each do |title|
  Accommodation.create!(
    type_of_place: Accommodation::TYPES_OF_PLACE.sample,
    title: title,
    price: rand(100..500),
    rating: rand(0..5),
    address: Faker::Address.full_address,
    bed_count: rand(1..5),
    bedroom_count: rand(1..5),
    bathroom_count: rand(1..5),
    city: Faker::Address.city,
    country: Faker::Address.country,
    max_guest_count: rand(1..7),
    description: Faker::Lorem.paragraph,
    user: User.all.sample
  )
end

puts "Created #{Accommodation.all.length} accommodation"

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
    booking: Booking.all.sample
  )
end

puts "Created #{Review.all.length} reviews"
