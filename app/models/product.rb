class Product < ApplicationRecord
  enum status: { active_archived: 0, pending_archived: 1, pending_category_approval: 2, active: 3 } 
  has_many :fine_prints
  has_many :purchase_options
  has_many :images_products
  has_many :products_target_customers
  has_many :target_customers, through: :products_target_customers
  belongs_to :product_type

  validates :title, presence: true, length: { minimum: 1, maximum: 80 }
  validates :category_id, presence: true
  validates :status, presence: true

  def default_image
    self.images_products.where(is_default: true).first
  end
end
