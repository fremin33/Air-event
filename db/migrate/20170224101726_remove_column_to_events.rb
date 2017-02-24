class RemoveColumnToEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :zip_code
    remove_column :events, :city
    remove_column :events, :country
  end
end
