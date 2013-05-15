json.array!(@job_listings) do |job_listing|
  json.extract! job_listing, :title, :provider_id, :description, :extra, :location_string, :url, :job_id
  json.url job_listing_url(job_listing, format: :json)
end