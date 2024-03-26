class AddPurchaseUrlToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :purchase_status, :boolean, default: false
    add_column :books, :purchase_url, :string
    add_column :books, :rent_status, :boolean, default: false
    add_column :users, :rent_limit, :integer, default: 0
    add_column :books, :cover, :string
  end
end
