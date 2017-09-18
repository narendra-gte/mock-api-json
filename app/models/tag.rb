class Tag < ApplicationRecord
  belongs_to :tag_category
  has_many :images_tags
end
