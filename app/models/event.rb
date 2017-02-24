class Event < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings
  has_attachment :picture

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
