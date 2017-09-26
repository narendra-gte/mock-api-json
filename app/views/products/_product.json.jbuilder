json.extract! product, :id, :business_id,
:title,
:description,
:status, 
:show_discount, :gifting_enabled, :sharing_enabled, :mobile_call_enabled, 
:created_at, :updated_at
json.category do
  json.id product.category_id
  json.name nil
end
json.product_type_attributes do
  json.partial! 'product_types/product_type', product_type: product.product_type
end
json.fine_prints_attributes do
  json.array! product.fine_prints, partial: 'fine_prints/fine_print', as: :fine_print
end
json.purchase_options_attributes do
  json.array! product.purchase_options, partial: 'purchase_options/purchase_option', as: :purchase_option
end
json.default_image product.default_image
json.images_products_attributes product.images_products do |images_product|
  json.id images_product.id
  json.image_id images_product.image_id
  json.is_default images_product.is_default
end
json.products_target_customers_attributes product.products_target_customers do |products_target_customer|
  json.id products_target_customer.id
  json.product_id products_target_customer.product_id
  json.target_customer_id products_target_customer.target_customer_id
end
