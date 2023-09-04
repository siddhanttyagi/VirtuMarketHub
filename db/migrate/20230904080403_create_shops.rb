class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :shop_name, null: false
      t.references :seller, null: false, foreign_key: true
      t.text :shop_summary
      t.timestamps
    end
  end
end
