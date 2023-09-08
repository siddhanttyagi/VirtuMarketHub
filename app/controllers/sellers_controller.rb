class SellersController < ApplicationController

  def index
    @user = Seller.new
  end

  def create
    @user = Seller.new(user_params)
    if @user.save
      session[:seller_id] = @user.id
      redirect_to sellers_home_path, notice: "Successfully created the account"
    else
      render :index, status: :unprocessable_entity
    end
  end

  def read
  end

  def update
  end

  def delete
  end

  private

  def user_params
    params.require(:seller).permit(:email, :password, :address, :sellername,:confirm_password)
  end
end
