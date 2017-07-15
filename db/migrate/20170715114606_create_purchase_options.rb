class CreatePurchaseOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :purchase_options do |t|
      t.belongs_to :product, foreign_key: true
      t.string :name
      t.integer :redemption_qty
      t.decimal :min_price
      t.decimal :retail_price
      t.integer :max_per_person
      t.integer :quantity_available
      t.string :sku

      t.timestamps
    end
  end
end
