class Localisation < ApplicationRecord
  has_many :events
  geocoded_by :full_street_address
  after_validation :geocode, if: :address_changed?

  private
  def full_street_address
    "#{address} #{zip_code}, #{city}"
  end
end
