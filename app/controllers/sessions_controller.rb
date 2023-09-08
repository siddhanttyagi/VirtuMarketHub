class SessionsController < ApplicationController
    def destroy
        session[:user_id]= nil
        redirect_to root_path, notice: "Logged out"
    end
    def create
        @check=true
        user=User.find_by(email: params[:email])
        if user.present? && user.password == params[:password]
            session[:user_id]=user.id
            redirect_to root_path, notice: "Logged in succesfully"
            @check=true
        else
            @check=false
            render 'users/read', status: :unprocessable_entity

        end
    end

    def createseller
    end
end