json.extract! user_backoffice_task, :id, :title, :description, :status, :priority, :shared, :user_id, :created_at, :updated_at
json.url user_backoffice_task_url(user_backoffice_task, format: :json)
