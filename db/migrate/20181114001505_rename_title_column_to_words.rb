class RenameTitleColumnToWords < ActiveRecord::Migration[5.2]
  def change
    rename_column :words, :title, :word
  end
end
