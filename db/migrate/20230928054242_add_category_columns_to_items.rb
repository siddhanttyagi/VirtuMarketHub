class AddCategoryColumnsToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :category1, :string
    add_column :items, :category2, :string
  end
end
