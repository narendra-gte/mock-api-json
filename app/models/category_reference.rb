class CategoryReference < ApplicationRecord
  belongs_to :category
  belongs_to :reference, :polymorphic => true
end
