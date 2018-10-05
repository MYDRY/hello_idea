class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.string     :message,  null: false
      t.boolean    :has_read, default: false, null: false
      t.references :user,     foreign_key: true

      t.timestamps
    end
  end
end
