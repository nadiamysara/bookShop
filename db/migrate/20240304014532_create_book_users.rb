class CreateBookUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :book_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.string :due_date
      t.string :date
      t.date :return_date

      t.timestamps
    end
  end
end
