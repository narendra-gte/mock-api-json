class CreateTargetCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :target_customers do |t|
      t.string :gender
      t.integer :min_age
      t.integer :max_age

      t.timestamps
    end
  end
end
