class AddUserNameToComents < ActiveRecord::Migration[5.2]
  def change
    add_column :coments, :user_name, :string
  end
end
