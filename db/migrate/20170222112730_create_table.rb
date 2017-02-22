class CreateTable < ActiveRecord::Migration[5.0]
  def change
    create_table :localisations do |t|
      t.string :address
      t.string :zip_code
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
