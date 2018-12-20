# frozen_string_literal: true

class CreateMandals < ActiveRecord::Migration[5.2]
  def change
    create_table :mandals do |t|
      t.string :core
      t.string :s1
      t.string :s2
      t.string :s3
      t.string :s4
      t.string :s5
      t.string :s6
      t.string :s7
      t.string :s8

      t.timestamps
    end
  end
end
