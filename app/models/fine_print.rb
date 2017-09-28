class FinePrint < ApplicationRecord
  belongs_to :product
  validates :text, presence: true, length: { minimum: 3, maximum: 80 }
end
