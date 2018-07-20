class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.text :body
      t.references :topic, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
