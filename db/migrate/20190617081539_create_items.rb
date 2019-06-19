class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :title, foreign_key: true
      t.integer :day
      t.string :place
      t.string :name
      t.integer :price
      t.string :tag_1
      t.string :tag_2

      t.timestamps
    end
  end
end
