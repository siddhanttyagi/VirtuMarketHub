class SessionsController < ApplicationController
    def destroy
        session[:user_id]= nil
        redirect_to root_path, notice: "Logged out"
    end
    def create
        user=User.find_by(email: params[:email])
        if user.present? 
    end
end