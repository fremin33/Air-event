class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :place, presence: true, :numericality => { :greater_than_or_equal_to => 1 }
end
