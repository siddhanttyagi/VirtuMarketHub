class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to root_path, notice: "Logged out"
  end

  def create
    @check = true
    user = User.find_by(email: params[:email])
    if user.present? && user.password == params[:password]
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in succesfully"
      @check = true
    else
      @check = false
      render "users/read", status: :unprocessable_entity
    end
  end

  def createseller
    @check = true
    user = Seller.find_by(email: params[:email])
    if user.present? && decrypt(user.password) == params[:password]
      session[:seller_id] = user.id
      redirect_to sellers_home_path, notice: "Logged in succesfully"
      @check = true
    else
      @check = false
      render "sellers/read", status: :unprocessable_entity
    end
  end

  def sellerdestroy
    session[:seller_id] = nil
    redirect_to sellers_signup_path, notice: "Logged out"
  end

  private

  def decrypt(encrypted_text)
    shift = 3  # You must use the same shift value as used for encryption
    decrypted_text = ""

    encrypted_text.each_char do |char|
      if char.match(/[a-zA-Z]/)
        shift_amount = (char.downcase == char) ? 97 : 65
        decrypted_char = ((char.ord - shift_amount - shift) % 26 + shift_amount).chr
      else
        decrypted_char = char
      end
      decrypted_text += decrypted_char
    end

    return decrypted_text
  end
end
