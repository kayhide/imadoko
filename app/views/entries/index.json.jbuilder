json.array!(@entries) do |entry|
  json.extract! entry, :id, :race_id, :number, :status
  json.url entry_url(entry, format: :json)
end
