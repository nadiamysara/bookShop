class AddPurchaseUrlToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :purchase_status, :boolean, default: false
    add_column :books, :purchase_url, :string
  end
end
