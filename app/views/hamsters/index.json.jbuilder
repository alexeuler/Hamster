json.array!(@hamsters) do |hamster|
  json.extract! hamster, :phone, :address, :name, :email
  json.url hamster_url(hamster, format: :json)
end
