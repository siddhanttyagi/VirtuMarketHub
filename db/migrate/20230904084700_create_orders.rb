class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :seller, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true
      t.boolean :payment_check
      t.text :order_details
      t.decimal :amount

      t.timestamps
    end
  end
end
