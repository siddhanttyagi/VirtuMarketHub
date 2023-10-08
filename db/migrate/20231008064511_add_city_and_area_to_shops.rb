class AddCityAndAreaToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :city, :string
    add_column :shops, :area, :string
  end
end
