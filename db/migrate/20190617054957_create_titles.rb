class CreateTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :titles do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end
