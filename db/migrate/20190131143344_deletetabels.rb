class Deletetabels < ActiveRecord::Migration[5.2]
  def change
    drop_table :comments
    drop_table :core_mandals
    drop_table :mandals
    drop_table :sub_mandals
  end
end
