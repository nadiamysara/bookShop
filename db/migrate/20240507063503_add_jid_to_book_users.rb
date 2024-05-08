class AddJidToBookUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :book_users, :jid, :string
    add_column :book_users, :extend_limit, :integer, default: 0
  end
end
