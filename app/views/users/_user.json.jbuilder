json.extract! user, :id, :first_name, :last_name, :profileable_id, :profileable_type, :created_at, :updated_at
json.url user_url(user, format: :json)
