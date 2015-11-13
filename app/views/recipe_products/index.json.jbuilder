json.array!(@recipe_products) do |recipe_product|
  json.extract! recipe_product, :id, :recipe_id, :product_id, :quantity
  json.url recipe_product_url(recipe_product, format: :json)
end
