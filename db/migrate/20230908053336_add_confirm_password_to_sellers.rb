class AddConfirmPasswordToSellers < ActiveRecord::Migration[7.0]
  def change
    add_column :sellers, :confirm_password, :string
  end
end
