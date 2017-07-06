class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.belongs_to :category, foreign_key: true
      t.integer :permission_level
      t.string :sku
      t.text :description

      t.timestamps
    end
  end
end
