class CreateProductTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :product_types do |t|
      t.text :name
      t.integer :status

      t.timestamps
    end
  end
end
