class AddUserIdOnTopicAndIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :user_id, :integer
    add_index  :topics, :user_id

    add_column :ideas, :user_id, :integer
    add_index  :ideas, :user_id
  end
end
