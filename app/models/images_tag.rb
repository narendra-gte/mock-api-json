class ImagesTag < ApplicationRecord
  belongs_to :tag
  validates_uniqueness_of :tag_id, :scope => :image_id
end
