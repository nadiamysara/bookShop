class AddJidToBookUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :book_users, :jid, :string
  end
end
