class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    reversible do |dir|
      dir.up do
        create_table :payments do |t|
          t.belongs_to :book_user, null: false, foreign_key: true
          t.decimal :price, default: 0.00
          t.boolean :status, default: false
          t.string :url

          t.timestamps
        end
      end
      dir.down do
        drop_table :payments
      end
    end
  end
end
