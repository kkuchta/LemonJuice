json.array!(@providers) do |provider|
  json.extract! provider, :name, :url
  json.url provider_url(provider, format: :json)
end