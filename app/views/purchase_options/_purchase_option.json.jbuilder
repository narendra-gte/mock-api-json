json.extract! purchase_option, :id, :product_id, :name, :redemption_qty, :min_price, :retail_price, :max_per_person, :quantity_available, :sku, :created_at, :updated_at
json.url purchase_option_url(purchase_option, format: :json)
