class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    reversible do |dir|
      dir.up do
        create_table :payments do |t|
          t.belongs_to :book_user, null: false, foreign_key: true
          t.decimal :price, default: 1.00
          t.boolean :status, default: false

          #t.string :order_number
          t.string :buyer_name
          t.string :buyer_email
          t.string :buyer_phone
          t.float :transaction_amount
          t.string :product_description
          t.string :callback_url
          t.string :redirect_url
          t.string :token
          t.boolean :redirect_post

          t.string :uid
          t.string :checksum

          t.timestamps
        end
      end
      dir.down do
        drop_table :payments
      end
    end
  end
end
