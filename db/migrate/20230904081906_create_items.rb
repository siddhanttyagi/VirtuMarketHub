class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :seller, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true
      t.string :item_name
      t.integer :quantity
      t.text :summary
      t.decimal :price

      t.timestamps
    end
  end
end
