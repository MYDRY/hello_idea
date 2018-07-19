class RemoveTitleFromIdeas < ActiveRecord::Migration[5.2]
  def change
    remove_column :ideas, :title, :string
  end
end
