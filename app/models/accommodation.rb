class Accommodation < ApplicationRecord
  belongs_to :user

  TYPES_OF_PLACE = ["Room", "Entire home"]

  validates :type_of_place, presence: true, uniqueness: true, inclusion: { in: TYPES_OF_PLACE }
  validates :price, presence: true
  validates :address, presence: true
  validates :bed_count, presence: true
  validates :bedroom_count, presence: true
  validates :bathroom_count, presence: true
end
