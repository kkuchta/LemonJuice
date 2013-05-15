json.array!(@jobs) do |job|
  json.extract! job, :role, :location
  json.url job_url(job, format: :json)
end