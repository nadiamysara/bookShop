class Book < ApplicationRecord
  has_many :book_users, dependent: :destroy
  has_many :users, through: :book_users, dependent: :destroy
  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres, dependent: :destroy
  has_one_attached :cover
end
