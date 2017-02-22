class Event < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings
  validates :price, :date, :place, :description, presence: true
  has_attachment :picture

  geocoded_by :full_street_address
  after_validation :geocode, if: :address_changed?

  def full_street_address
    "#{address} #{zip_code}, #{city}"
  end
end
