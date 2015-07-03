json.array!(@followuptypes) do |followuptype|
  json.extract! followuptype, :id
  json.url followuptype_url(followuptype, format: :json)
end
