class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :accommodation

  STATUS = ["Pending", "Accepted", "Declined"]

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :guest_count, presence: true
  validates :status, presence: true, inclusion: STATUS
end
