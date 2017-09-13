class CreateCategoriesProductTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_product_types do |t|
      t.integer :category_id
      t.belongs_to :product_type, foreign_key: true

      t.timestamps
    end
  end
end
