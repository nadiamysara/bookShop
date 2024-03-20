class BookUser < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_one  :payment

end
