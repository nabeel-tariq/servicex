json.extract! job, :id, :name, :description, :status_id, :employer_id, :created_at, :updated_at
json.url job_url(job, format: :json)
