class Accommodation < ApplicationRecord
  belongs_to :user
  has_many :accommodation_amenities
  has_many :amenities, through: :accommodation_amenities

  TYPES_OF_PLACE = ["Room", "Entire home"]

  validates :type_of_place, presence: true, inclusion: { in: TYPES_OF_PLACE }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :address, presence: true
  validates :bed_count, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :bedroom_count, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :bathroom_count, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
