class CreateMandalIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :mandal_ideas do |t|
      t.references :sea, foreign_key: true, null: false
      t.references :simple_mandal, foreign_key: true, null: false

      t.timestamps
    end
  end
end
