class Product < ApplicationRecord
  enum status: { active: 1, active_archived: 0, pending_category_approval:-1,pending_archived:2 }
  has_many :fine_prints
  has_many :purchase_options
  has_many :images_products
  has_many :products_target_customers
  has_many :target_customers, through: :products_target_customers

  def status_value
    Product.statuses.select{|c,h| c==self.status}.values[0]
  end

end
