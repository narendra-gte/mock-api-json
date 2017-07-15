class Product < ApplicationRecord
  has_many :fine_prints
  has_many :purchase_options
  has_many :images_products
  has_many :products_target_customers
  has_many :target_customers, through: :products_target_customers
end
