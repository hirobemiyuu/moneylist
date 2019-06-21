class AddUseridToComents < ActiveRecord::Migration[5.2]
  def change
    add_column :coments, :userid, :integer
  end
end
