class Business < ApplicationRecord
  belongs_to :owner
  has_many :category_references, :as => :reference
  has_many :categories, :through => :category_references
end
