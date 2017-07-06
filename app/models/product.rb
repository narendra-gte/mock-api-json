class Product < ApplicationRecord
  belongs_to :category
  enum permission_level: [ :master_admin_only, :store_admin, :store_admin_and_staff, :all_employees ]
  validates :title, presence: true
end
