class CreateHistories < ActiveRecord::Migration[7.1]
  def change
    reversible do |dir|
      dir.up do
        create_table :histories do |t|
          t.string :source
          t.string :payment_status
          t.string :currency
          t.float :transaction_amount
          t.float :transaction_amount_received
          t.string :order_number
          t.string :merchant_reference_number
          t.string :exchange_number
          t.string :buyer_name
          t.string :buyer_phone
          t.string :buyer_email
          t.string :payment_id
          t.string :client_ip
          t.string :status_url
          t.string :retry_url
          t.string :receipt_url
          t.string :checksum
          t.float :transaction_fee
          t.string :payment_mode
          t.string :payment_method
          t.string :fpx_model
          t.string :fpx_debit_auth_code
          #t.string :params
          #t.belongs_to :book_user, index: { unique: true }, foreign_key: true
          #t.belongs_to :user_id

          t.timestamps
        end
      end
      dir.down do
        drop_table :histories
      end
    end
  end
end
