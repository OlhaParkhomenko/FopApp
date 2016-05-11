json.array!(@people) do |person|
  json.extract! person, :id, :fullname, :address, :status
  json.url person_url(person, format: :json)
end
