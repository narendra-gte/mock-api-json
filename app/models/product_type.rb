class ProductType < ApplicationRecord
  enum status: [ :unapproved, :approved, :disapproved ]
  has_many :products
end
