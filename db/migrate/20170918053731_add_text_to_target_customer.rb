class AddTextToTargetCustomer < ActiveRecord::Migration[5.1]
  def change
    add_column :target_customers, :text, :string
  end
end
