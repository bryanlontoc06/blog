json.extract! task, :id, :category_id, :name, :body, :task_date, :created_at, :updated_at
json.url task_url(task, format: :json)
