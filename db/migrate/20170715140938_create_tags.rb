class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.belongs_to :tag_category, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
