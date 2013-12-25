json.array!(@races) do |race|
  json.extract! race, :id, :label, :url, :crawler, :distance, :starts_at, :ends_at
  json.url race_url(race, format: :json)
end
