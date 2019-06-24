class AddImageToComent < ActiveRecord::Migration[5.2]
  def change
    add_column :coments, :image, :string
  end
end
