class CreateCategoryReferences < ActiveRecord::Migration[5.1]
  def change
    create_table :category_references do |t|
      t.belongs_to :category, foreign_key: true
      t.integer :reference_id
      t.string :reference_type
      t.boolean :primary

      t.timestamps
    end
  end
end
