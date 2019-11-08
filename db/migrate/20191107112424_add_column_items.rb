class AddColumnItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :explanation, :text, null: false
    add_column :items, :size, :string
    add_column :items, :price, :integer, null: false
    add_column :items, :status, :string, null: false
    add_column :items, :delivery_fee, :string, null: false
    add_column :items, :delivery_origin, :string, null: false
    add_column :items, :delivery_type, :string, null: false
    add_column :items, :schedule, :string, null: false
    add_reference :items, :user, foreign_key: true
  end
end
