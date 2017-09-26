class ProductType < ApplicationRecord
  enum status: [ :unapproved, :approved, :disapproved ]
  has_many :products
  default_scope { order(name: :asc) }

  validates :name, presence: true, uniqueness: true
  validates :status, presence: true
end
