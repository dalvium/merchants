json.extract! merchant, :id, :email, :name, :city, :street, :country_code, :extra, :created_at, :updated_at
json.url merchant_url(merchant, format: :json)
