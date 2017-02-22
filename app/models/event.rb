class Event < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings
  belongs_to :localisation
  validates :price, :date, :place, :description, presence: true
  has_attachment :picture
end
