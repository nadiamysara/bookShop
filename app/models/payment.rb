class Payment < ApplicationRecord
  belongs_to :book_user

  def g_checksum
    #string = "amsyar@gmail.com|AHMAD AMSYAR MOHD ALI|+60123121678||20200425132755|Payment for order no 20200425132755||1540.40|2aaa1633-e63f-4371-9b85-91d936aa56a1​"
    #checksum_token = "​159026b3b7348e2390e5a2e7a1c8466073db239c1e6800b8c27e36946b1f8713​"
    #OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), checksum_token, string)
  end
end
