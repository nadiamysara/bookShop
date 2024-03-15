class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    reversible do |dir|
      dir.up do
        create_table :payments do |t|
          t.belongs_to :book_user, null: false, foreign_key: true
          t.boolean :status, default: false
          t.belongs_to :user, foreign_key: true
          t.string :buyer_name
          t.string :buyer_email
          t.string :buyer_phone
          t.float :transaction_amount, default: 2.00
          t.string :product_description

          t.timestamps
        end
      end
      dir.down do
        drop_table :payments
      end
    end
  end
end
