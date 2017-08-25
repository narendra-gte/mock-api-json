class Product < ApplicationRecord
  enum status: { active: 1, archived: 0, pending_category_approval:-1 }
  has_many :fine_prints
  has_many :purchase_options
  has_many :images_products
  has_many :products_target_customers
  has_many :target_customers, through: :products_target_customers
  belongs_to :product_type

  def status_value
    Product.statuses.select{|c,h| c==self.status}.values[0]
  end

end
