class RenameIdeaIdColumnToLikes < ActiveRecord::Migration[5.2]
  def change
    rename_column :likes, :idea_id, :likable_id
  end
end
