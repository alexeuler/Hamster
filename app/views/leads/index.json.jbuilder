json.array!(@leads) do |lead|
  json.extract! lead, :phone, :address, :name, :email
  json.url lead_url(lead, format: :json)
end
