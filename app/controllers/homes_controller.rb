class HomesController < ApplicationController
    def index
        if session[:user_id]
            @user=User.find_by(id: session[:user_id])
        end
    end
    def sellersindex
        if session[:seller_id]
            @user=Seller.find_by(id: session[:seller_id])
        end
    end
    
end