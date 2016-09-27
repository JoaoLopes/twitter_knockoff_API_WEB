json.extract! user, :id, :username, :hashed_password, :created_by, :created_at, :updated_at
json.url user_url(user, format: :json)