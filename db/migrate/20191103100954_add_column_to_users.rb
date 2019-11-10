class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :name_full, :name_family_kanji
    add_column :users, :name_first_kanji, :string
    rename_column :users, :name_reading, :name_family_kana
    add_column :users, :name_first_kana, :string
  end
end
