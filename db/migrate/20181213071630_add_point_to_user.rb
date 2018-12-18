# frozen_string_literal: true

class AddPointToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :point, :integer, default: 100
  end
end
