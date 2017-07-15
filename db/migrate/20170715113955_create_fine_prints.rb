class CreateFinePrints < ActiveRecord::Migration[5.1]
  def change
    create_table :fine_prints do |t|
      t.belongs_to :product, foreign_key: true
      t.string :text

      t.timestamps
    end
  end
end
