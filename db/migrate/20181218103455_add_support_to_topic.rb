class AddSupportToTopic < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :support, :integer, default: 0
  end
end
