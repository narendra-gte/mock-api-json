json.extract! product, :id, :title, :category_id, :permission_level, :sku, :description, :created_at, :updated_at
json.url product_url(product, format: :json)
