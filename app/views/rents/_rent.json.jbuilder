json.extract! rent, :id, :book, :user, :dateBorrowed, :dateDue, :created_at, :updated_at
json.url rent_url(rent, format: :json)
