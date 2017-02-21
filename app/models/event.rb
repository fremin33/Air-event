class Event < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :address, :price, :date, :place, :description, presence: true
  has_attachment :picture
end
