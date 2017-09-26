class Product < ApplicationRecord
  enum status: [ :active, :retired ] 
  has_many :fine_prints
  has_many :purchase_options
  has_many :images_products
  has_many :products_target_customers
  has_many :target_customers, through: :products_target_customers
  belongs_to :product_type

  validates :title, presence: true, length: { minimum: 1, maximum: 80 }
  validates :category_id, presence: true
  validates :status, presence: true

  accepts_nested_attributes_for :fine_prints, allow_destroy: true, reject_if: proc { |attributes| attributes['text'].blank? }

  accepts_nested_attributes_for :purchase_options, allow_destroy: true, reject_if: :all_blank

  accepts_nested_attributes_for :images_products, allow_destroy: true, reject_if: :all_blank

  accepts_nested_attributes_for :products_target_customers, allow_destroy: true, reject_if: :all_blank

  accepts_nested_attributes_for :product_type

  def default_image
    self.images_products.where(is_default: true).first
  end
end
