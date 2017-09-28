json.extract! product_type, :id, :name, :status, :created_at
if @current_user.admin?
  json.products do
    json.partial! partial: 'products/product', collection: product_type.products, as: :product, locals: { hide_product_types: true } 
  end
end
