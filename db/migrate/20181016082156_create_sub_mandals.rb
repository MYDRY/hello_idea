class CreateSubMandals < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_mandals do |t|
      t.string :body
      t.references :mandal, polymorphic: true, index: true

      t.timestamps
    end
  end
end
