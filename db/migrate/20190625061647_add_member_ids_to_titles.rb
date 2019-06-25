class AddMemberIdsToTitles < ActiveRecord::Migration[5.2]
  def change
    add_column :titles, :memberids, :text
  end
end
