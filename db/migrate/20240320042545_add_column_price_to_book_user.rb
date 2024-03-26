class AddColumnPriceToBookUser < ActiveRecord::Migration[7.1]
  def change
    reversible do |dir|
      change_table :book_users do |t|
        dir.up do
          t.rename :status, :due_status
          t.change :due_status, :boolean, default: false
          t.column :rent_status, :boolean, default: false
          t.column :price, :float, default: 0.00
          t.remove :desc, :string
          t.remove :checksum, :string
          t.remove :token, :string
        end
        dir.down do
          t.rename :due_status, :status
          t.change :status, :string
          t.remove :rent_status, :boolean, default: false
          t.remove :price, :float, default: 0.00
          t.column :desc, :string
          t.column :checksum, :string
          t.column :token, :string
        end
      end
    end
  end
end
