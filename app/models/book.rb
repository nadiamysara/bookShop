class Book < ApplicationRecord
  belongs_to :author
  has_many :book_users, dependent: :destroy
  has_many :users, through: :book_users, dependent: :destroy
  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres, dependent: :destroy
  has_one_attached :cover

  def self.ransackable_associations(auth_object = nil)
    ["author", "book_genres", "book_users", "genres"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["author", "genres", "title", "year"]
  end
end
