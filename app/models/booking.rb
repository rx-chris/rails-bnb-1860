class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :accommodation

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :guest_count, presence: true
end
