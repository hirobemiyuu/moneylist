class AddUseridToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :userid, :integer
  end
end
