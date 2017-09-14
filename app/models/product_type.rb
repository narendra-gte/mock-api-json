class ProductType < ApplicationRecord
  enum status: [ :pending_approval, :approved ]
  has_many :products
end
