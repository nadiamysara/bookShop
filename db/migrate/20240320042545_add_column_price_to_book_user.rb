class AddColumnPriceToBookUser < ActiveRecord::Migration[7.1]
  def change
    add_column :book_users, :price, :float, default: 0.00
  end
end
