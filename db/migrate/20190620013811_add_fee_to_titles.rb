class AddFeeToTitles < ActiveRecord::Migration[5.2]
  def change
    add_column :titles, :fee, :integer
  end
end
