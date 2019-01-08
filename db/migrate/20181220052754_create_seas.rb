class CreateSeas < ActiveRecord::Migration[5.2]
  def change
    create_table :seas do |t|
      t.text :body, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
