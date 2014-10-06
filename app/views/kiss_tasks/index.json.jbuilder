json.array!(@kiss_tasks) do |kiss_task|
  json.extract! kiss_task, :id, :name, :description, :script
  json.url kiss_task_url(kiss_task, format: :json)
end
