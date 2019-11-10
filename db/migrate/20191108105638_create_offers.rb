class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.integer :price, null: false
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true 
      t.timestamps
    end
  end
end
