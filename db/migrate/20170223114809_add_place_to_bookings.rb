class AddPlaceToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :place, :integer
  end
end
