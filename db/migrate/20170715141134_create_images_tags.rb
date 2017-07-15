class CreateImagesTags < ActiveRecord::Migration[5.1]
  def change
    create_table :images_tags do |t|
      t.belongs_to :tag, foreign_key: true
      t.integer :image_id

      t.timestamps
    end
  end
end
