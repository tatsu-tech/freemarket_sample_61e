class AddProcessToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :process, :integer, null: false, default: 0
  end
end
