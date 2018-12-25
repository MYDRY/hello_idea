class AddLinkToNotice < ActiveRecord::Migration[5.2]
  def change
    add_column :notices, :link, :string
  end
end
