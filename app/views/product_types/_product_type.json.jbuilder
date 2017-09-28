json.extract! product_type, :id, :name, :status
if @current_user.is_admin
  json.products do
    json.partial! partial: 'products/product', collection: product_type.products, as: :product, locals: { hide_product_types: true } 
  end
end
