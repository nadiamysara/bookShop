json.extract! book_user, :id, :user_id_id, :book_id_id, :due_date, :return_date, :status, :created_at, :updated_at
json.url book_user_url(book_user, format: :json)
