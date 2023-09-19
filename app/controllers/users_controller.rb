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
    @user=User.new
  end

  def delete
  end

  def profile
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
  end

  def editprofile
    if session[:user_id]
      @user = User.find(session[:user_id])
      if @user.update(update_params)
        redirect_to root_path, notice: "User was successfully updated."
      else
        redirect_to updateprofile_path, status: :unprocessable_entity
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :address, :username, :password_confirmation)
  end
  def update_params
    allowed_params = {}
    allowed_params[:password] = params[:user][:password] if params[:user][:password].present?
    allowed_params[:address] = params[:user][:address] if params[:user][:address].present?
    allowed_params[:username] = params[:user][:username] if params[:user][:username].present?
    allowed_params[:password_confirmation] = params[:user][:password_confirmation] if params[:user][:password_confirmation].present?
    allowed_params
  end
end
