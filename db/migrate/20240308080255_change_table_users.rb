class ChangeTableUsers < ActiveRecord::Migration[7.1]
  def change
    reversible do |dir|
      dir.up do
        change_table :users do |t|
          t.rename :name, :name
          t.column :phone, :string
        end
        change_table :book_users do |t|
          t.column :desc, :string
          t.column :checksum, :string
          t.column :token, :string
        end
      end

      dir.down do
        change_table :users do |t|
          t.rename :name, :name
          t.remove :phone
        end
        change_table :book_users do |t|
          t.remove :desc
          t.remove :checksum
          t.remove :token
        end
      end
    end
  end
end
