class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|

      t.string :send_name_family_kanji, null: false
      t.string :send_name_first_kanji,  null: false
      t.string :send_name_family_kana,  null: false
      t.string :send_name_first_kana,   null: false
      t.string :zip,                    null: false
      t.string :prefecture,             null: false
      t.string :city,                   null: false
      t.string :town,                   null: false
      t.string :apartment
      t.string :phone_number 

      t.timestamps
    end
  end
end
