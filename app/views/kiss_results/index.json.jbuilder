json.array!(@kiss_results) do |kiss_result|
  json.extract! kiss_result, :id, :status, :output, :error, :kiss_task_id, :server_id
  json.url kiss_result_url(kiss_result, format: :json)
end
