class RemoveLocalisation < ActiveRecord::Migration[5.0]
  def change
    drop_table :localisations
    remove_column :events, :localisation_id
  end
end
