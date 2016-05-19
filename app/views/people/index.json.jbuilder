json.array!(@people) do |person|
  json.extract! person, :id, :surname, :name, :middle_name, :address, :status
  json.url person_url(person, format: :json)
end
