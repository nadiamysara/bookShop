class Author < ApplicationRecord
  has_many :books
  has_one_attached :potrait

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
