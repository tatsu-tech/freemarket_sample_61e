class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :price, null: false
      t.string :payment_style, null: false
      t.string :status, null: false
      t.date :payment_date
      t.date :request_date
      t.date :remittance_date
      t.date :delivery_date
      t.string :grade
      t.text :review
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
