class RemoveCategoryIdFromProductTypes < ActiveRecord::Migration[5.1]
  def change
    remove_column :product_types, :category_id, :integer
  end
end
