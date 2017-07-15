class CreateImagesProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :images_products do |t|
      t.belongs_to :product, foreign_key: true
      t.integer :image_id
      t.boolean :is_default

      t.timestamps
    end
  end
end
