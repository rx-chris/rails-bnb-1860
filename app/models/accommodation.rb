class Accommodation < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :accommodation_amenities, dependent: :destroy
  has_many :amenities, through: :accommodation_amenities
  has_many :reviews, through: :bookings
  has_many_attached :photos
  belongs_to :user

  TYPES_OF_PLACE = ["Room", "Entire home"]

  validates :type_of_place, presence: true, inclusion: { in: TYPES_OF_PLACE }
  validates :title, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :bed_count, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :bedroom_count, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :bathroom_count, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :city, presence: true
  validates :country, presence: true
  validates :description, presence: true
  validates :max_guest_count, presence: true, numericality: { greater_than_or_equal_to: 0 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def host_name
    user.display_name
  end
end
