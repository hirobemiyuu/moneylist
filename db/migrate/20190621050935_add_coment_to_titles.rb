class AddComentToTitles < ActiveRecord::Migration[5.2]
  def change
    add_column :titles, :coment, :text
  end
end
