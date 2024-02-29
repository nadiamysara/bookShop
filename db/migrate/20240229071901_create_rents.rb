class CreateRents < ActiveRecord::Migration[7.1]
  def change
    create_table :rents do |t|
      t.string :book
      t.string :user
      t.date :dateBorrowed
      t.date :dateDue

      t.timestamps
    end
  end
end
