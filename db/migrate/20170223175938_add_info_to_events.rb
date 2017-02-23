class AddInfoToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :infos, :text
  end
end
