json.extract! product, :id, :category_id, :business_id,
:title,
:description,
:status, 
:show_discount, :gifting_enabled, :sharing_enabled, :mobile_call_enabled, 
:created_at, :updated_at
json.product_type product.product_type
json.fine_prints product.fine_prints
json.purchase_options product.purchase_options
json.default_image product.default_image
json.images_products product.images_products
json.target_customers product.target_customers
