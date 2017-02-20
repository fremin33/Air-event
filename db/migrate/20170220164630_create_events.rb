class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :address
      t.string :picture
      t.string :category
      t.integer :price
      t.integer :place
      t.datetime :date
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
