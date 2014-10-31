json.array!(@venues) do |venue|
  json.extract! venue, :name, :description, :created_at, :updated_at, :plan_id
  json.url venue_url(venue, format: :json)
end
