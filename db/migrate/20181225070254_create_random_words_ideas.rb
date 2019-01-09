class CreateRandomWordsIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :random_words_ideas do |t|
      t.references :sea, foreign_key: true, null: false
      t.references :word1, foreign_key: { to_table: :words }, null: false
      t.references :word2, foreign_key: { to_table: :words }, null: false

      t.timestamps
    end
  end
end
