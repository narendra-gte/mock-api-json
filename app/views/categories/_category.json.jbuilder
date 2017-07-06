json.extract! category, :id, :parent_id, :name, :description, :created_at, :updated_at
json.url category_url(category, format: :json)
