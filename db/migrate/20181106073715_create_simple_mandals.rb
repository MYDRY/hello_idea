class CreateSimpleMandals < ActiveRecord::Migration[5.2]
  def change
    create_table :simple_mandals do |t|
      t.string :elem_1_1
      t.string :elem_1_2
      t.string :elem_1_3
      t.string :elem_1_4
      t.string :elem_1_5
      t.string :elem_1_6
      t.string :elem_1_7
      t.string :elem_1_8
      t.string :elem_1_9
      t.string :elem_2_1
      t.string :elem_2_2
      t.string :elem_2_3
      t.string :elem_2_4
      t.string :elem_2_5
      t.string :elem_2_6
      t.string :elem_2_7
      t.string :elem_2_8
      t.string :elem_2_9
      t.string :elem_3_1
      t.string :elem_3_2
      t.string :elem_3_3
      t.string :elem_3_4
      t.string :elem_3_5
      t.string :elem_3_6
      t.string :elem_3_7
      t.string :elem_3_8
      t.string :elem_3_9
      t.string :elem_4_1
      t.string :elem_4_2
      t.string :elem_4_3
      t.string :elem_4_4
      t.string :elem_4_5
      t.string :elem_4_6
      t.string :elem_4_7
      t.string :elem_4_8
      t.string :elem_4_9
      t.string :elem_5_1
      t.string :elem_5_2
      t.string :elem_5_3
      t.string :elem_5_4
      t.string :elem_5_5
      t.string :elem_5_6
      t.string :elem_5_7
      t.string :elem_5_8
      t.string :elem_5_9
      t.string :elem_6_1
      t.string :elem_6_2
      t.string :elem_6_3
      t.string :elem_6_4
      t.string :elem_6_5
      t.string :elem_6_6
      t.string :elem_6_7
      t.string :elem_6_8
      t.string :elem_6_9
      t.string :elem_7_1
      t.string :elem_7_2
      t.string :elem_7_3
      t.string :elem_7_4
      t.string :elem_7_5
      t.string :elem_7_6
      t.string :elem_7_7
      t.string :elem_7_8
      t.string :elem_7_9
      t.string :elem_8_1
      t.string :elem_8_2
      t.string :elem_8_3
      t.string :elem_8_4
      t.string :elem_8_5
      t.string :elem_8_6
      t.string :elem_8_7
      t.string :elem_8_8
      t.string :elem_8_9
      t.string :elem_9_1
      t.string :elem_9_2
      t.string :elem_9_3
      t.string :elem_9_4
      t.string :elem_9_5
      t.string :elem_9_6
      t.string :elem_9_7
      t.string :elem_9_8
      t.string :elem_9_9

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
