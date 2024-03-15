class Payment < ApplicationRecord
  belongs_to :book_user
  belongs_to :user

  def g_checksum
    string = "#{buyer_email}|#{buyer_name}|#{buyer_phone}||#{id}|#{product_description}|https://webhook.site/86cb02c4-8a44-4009-a0d0-f4a8d48e734c|#{transaction_amount}|96111c67-91fc-43dd-b3fa-ad2e3a323753"
    checksum_token = "b6fe5d19b820e622b836aff46724ec37ab45b795e734fd6348a2432d7a5e06e9"
    OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), checksum_token, string)
  end
end
