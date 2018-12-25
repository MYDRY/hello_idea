class CreateInvests < ActiveRecord::Migration[5.2]
  def change
    create_table :invests do |t|
      t.references :topic, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
