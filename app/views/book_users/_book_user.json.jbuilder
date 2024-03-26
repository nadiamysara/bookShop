json.extract! book_user, :id, :user_id, :book_id, :due_date, :return_date, :rent_status, :due_status, :created_at, :updated_at
json.url book_user_url(book_user, format: :json)
