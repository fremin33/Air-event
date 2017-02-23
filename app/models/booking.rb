class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :place, presence: true
end
