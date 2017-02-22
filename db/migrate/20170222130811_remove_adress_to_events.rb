class RemoveAdressToEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column(:events, :address)
    add_reference(:events, :localisation)
  end
end
