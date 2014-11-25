json.array!(@products) do |product|
  json.extract! product, :id, :name, :categories, :description, :image_urls, :regular_price, :discount_price, :discount_start_time, :discount_end_time, :discount_inventory
  json.url product_url(product, format: :json)
end
