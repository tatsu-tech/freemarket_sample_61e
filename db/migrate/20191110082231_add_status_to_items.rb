class AddStatusToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :status, :integer, null: false, default: 0
    add_column :items, :delivery_fee, :integer, null: false, default: 0
    add_column :items, :delivery_origin, :integer, null: false, default: 0
    add_column :items, :delivery_type, :integer, null: false, default: 0
    add_column :items, :schedule, :integer, null: false, default: 0
  end
end
