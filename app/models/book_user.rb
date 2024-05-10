class BookUser < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_one  :payment, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["book_id", "created_at", "due_date", "due_status", "extend_limit", "id", "id_value", "jid", "price", "rent_status", "return_date", "updated_at", "user_id"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["book", "payment", "user"]
  end
  ransacker :created_at do
    Arel.sql('date(created_at)')
  end
  ransacker :return_date do
    Arel.sql('date(return_date)')
  end
end
