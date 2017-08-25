json.extract! product_type, :id, :name, :category_id, :status, :created_at, :updated_at
json.url product_type_url(product_type, format: :json)
