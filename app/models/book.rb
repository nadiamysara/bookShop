class Book < ApplicationRecord
  has_many :book_users
  has_many :user, through: :book_users
end
