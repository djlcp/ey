json.extract! user, :id, :last_name, :first_name, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
