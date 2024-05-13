class Payment < ApplicationRecord
  belongs_to :book_user
  belongs_to :user

  def self.ransackable_associations(auth_object = nil)
    ["book_user", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["book_user_id", "buyer_email", "buyer_name", "buyer_phone", "created_at", "id", "id_value", "order_number", "product_description", "status", "transaction_amount", "updated_at", "user_id"]
  end
  ransacker :created_at do
    Arel.sql('date(created_at)')
  end

  def g_checksum
    string = "#{buyer_email}|#{buyer_name}|#{buyer_phone}||#{order_number}|#{product_description}|http://localhost:3000/payments/#{id}/redirect|#{transaction_amount}|96111c67-91fc-43dd-b3fa-ad2e3a323753"
    checksum_token = "b6fe5d19b820e622b836aff46724ec37ab45b795e734fd6348a2432d7a5e06e9"
    OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), checksum_token, string)
  end
end
