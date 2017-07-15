class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :category_id
      t.integer :business_id
      t.string :title
      t.string :description
      t.boolean :show_discount
      t.boolean :gifting_enabled
      t.boolean :sharing_enabled
      t.boolean :mobile_call_enabled

      t.timestamps
    end
  end
end
