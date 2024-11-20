class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings, dependent: :destroy
  has_many :accommodations, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def display_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
