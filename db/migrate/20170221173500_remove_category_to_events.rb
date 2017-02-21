class RemoveCategoryToEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column(:events, :category)
    add_reference(:events, :category)
  end
end
