json.array!(@marketers) do |marketer|
  json.extract! marketer, :id, :email
  json.url marketer_url(marketer, format: :json)
end
