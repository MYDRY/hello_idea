class AddColumnsToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :likable_type, :string
  end
end
