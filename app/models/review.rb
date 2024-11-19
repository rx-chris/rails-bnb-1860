class Review < ApplicationRecord
  belongs_to :accommodation
  belongs_to :user
end
