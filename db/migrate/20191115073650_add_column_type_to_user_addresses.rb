class AddColumnTypeToUserAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :user_addresses, :prefecture, :integer, null: false, default: 0
  end
end
