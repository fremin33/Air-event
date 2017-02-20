class Event < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :address, :picture, :price, :date, :place, :description, presence: true
end
