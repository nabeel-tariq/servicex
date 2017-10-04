json.extract! technician, :id, :first_name, :last_name, :is_active, :created_at, :updated_at
json.url technician_url(technician, format: :json)
