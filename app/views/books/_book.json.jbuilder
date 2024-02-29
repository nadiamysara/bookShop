json.extract! book, :id, :title, :genre, :year, :desc, :created_at, :updated_at
json.url book_url(book, format: :json)
