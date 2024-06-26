class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :book_users, dependent: :destroy
  has_many :book, through: :book_users, dependent: :destroy
  has_many :payments, dependent: :destroy
end
