class SellersController < ApplicationController

  def index
    @user = Seller.new
  end

  def create
    @user = Seller.new(user_params)
    @user.password=encrypt(user_params[:password])
    @user.confirm_password=encrypt(user_params[:confirm_password])
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

  def encrypt(text)
    shift = 3  # You can adjust the shift value as needed
    encrypted_text = ""
    
    text.each_char do |char|
      if char.match(/[a-zA-Z]/)
        shift_amount = (char.downcase == char) ? 97 : 65
        encrypted_char = ((char.ord - shift_amount + shift) % 26 + shift_amount).chr
      else
        encrypted_char = char
      end
      encrypted_text += encrypted_char
    end
  
    return encrypted_text
  end




end
