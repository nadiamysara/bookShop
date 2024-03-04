class ChangeColumnFromBookUser < ActiveRecord::Migration[7.1]
  def change
    change_column(:book_users, :due_date, :date)
    change_column(:book_users, :return_date, :datetime)
    remove_column :book_users, :date

    drop_table :controllers do |t|
      t.string :author
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end

  end
end
