json.extract! payment, :id, :rent_id, :price, :status, :url, :created_at, :updated_at
json.url payment_url(payment, format: :json)
