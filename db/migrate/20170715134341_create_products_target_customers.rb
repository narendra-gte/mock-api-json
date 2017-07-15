class CreateProductsTargetCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :products_target_customers do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :target_customer, foreign_key: true

      t.timestamps
    end
  end
end
