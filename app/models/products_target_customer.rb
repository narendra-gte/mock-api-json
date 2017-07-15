class ProductsTargetCustomer < ApplicationRecord
  belongs_to :product
  belongs_to :target_customer
end
