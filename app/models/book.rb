class Book < ApplicationRecord
  has_many :book_users, dependent: :destroy
  has_many :user, through: :book_users, dependent: :destroy
end
