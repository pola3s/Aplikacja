json.array!(@subscriptions) do |subscription|
  json.extract! subscription, :id, :name, :description, :price
  json.url subscription_url(subscription, format: :json)
end
