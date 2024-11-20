class Accommodation < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :accommodation_amenities, dependent: :destroy
  has_many :amenities, through: :accommodation_amenities
  belongs_to :user

  TYPES_OF_PLACE = ["Room", "Entire home"]

  validates :type_of_place, presence: true, inclusion: { in: TYPES_OF_PLACE }
  validates :title, presence: true, uniqueness: true
  validates :price, presence: true
  validates :address, presence: true
  validates :bed_count, presence: true
  validates :bedroom_count, presence: true
  validates :bathroom_count, presence: true

  def host_name
    user.display_name
  end
end
