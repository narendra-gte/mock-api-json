class Tag < ApplicationRecord
  belongs_to :tag_category
  has_many :images_tags
  validates :name, presence: true, length: { maximum: 30 }
  validates_uniqueness_of :name, :scope => :tag_category_id
  accepts_nested_attributes_for :images_tags, allow_destroy: true, reject_if: :reject_images_tags

  def reject_images_tags(attributes)
    attributes['image_id'].blank?
  end
end
