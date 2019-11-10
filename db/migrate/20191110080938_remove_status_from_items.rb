class RemoveStatusFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :status, :string
    remove_column :items, :delivery_fee, :string
    remove_column :items, :delivery_origin, :string
    remove_column :items, :delivery_type, :string
    remove_column :items, :schedule, :string
  end
end
