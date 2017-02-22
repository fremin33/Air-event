class AddFieldsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :address, :string
    add_column :events, :zip_code, :string
    add_column :events, :city, :string
    add_column :events, :country, :string
    add_column :events, :latitude, :float
    add_column :events, :longitude, :float
  end
end
