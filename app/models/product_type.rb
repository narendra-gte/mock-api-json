class ProductType < ApplicationRecord
  enum status: [ :pending_approval, :approved ]
  has_many :products
  has_many :categories_product_types
end
