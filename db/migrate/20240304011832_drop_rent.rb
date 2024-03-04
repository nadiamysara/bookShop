class DropRent < ActiveRecord::Migration[7.1]
  def change
    drop_table :rents do |t|
      t.string :email, null: false
      t.timestamps null: false
      t.string :book
      t.string :user
      t.date :dateBorrowed
      t.date :dateDue
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
