class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully created the account"
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
    params.require(:user).permit(:email, :password, :address, :username,:password_confirmation)
  end
end
