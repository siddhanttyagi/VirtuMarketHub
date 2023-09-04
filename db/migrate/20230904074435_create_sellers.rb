class CreateSellers < ActiveRecord::Migration[6.0]
  def change
    create_table :sellers do |t|
      t.string :sellername, null: false
      t.string :email, null: false, unique: true
      t.string :password
      t.string :address
      t.timestamps
    end
  end
end
