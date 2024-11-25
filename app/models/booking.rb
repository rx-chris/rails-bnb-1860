class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :accommodation
  has_one :review, dependent: :destroy

  STATUSES = ["Pending", "Accepted", "Declined"].freeze

  validates :start_date, presence: true
  validates :end_date, presence: true
  # validates :guest_count, presence: true
  # validates :status, presence: true, inclusion: { in: STATUSES }
end
