class ItemsController < ApplicationController
   

    def index
        @items=Item.where(shop_id: params[:shop_id])
        session[:tempshop_id]=params[:shop_id]
    end

    def cart
        if session[:user_id]
            session[:cart_data] ||= {}
            item_id=params[:item_id]
            session[:cart_data][item_id]=params[:quantity]
            redirect_to carts_path
        end
        
        
        

    end

    def carts
        if session[:user_id]
            @data=session[:cart_data]
            item_ids=session[:cart_data].keys
            @items=Item.where(id: item_ids)
            @tempshop_id=session[:tempshop_id]
        end
    end

    def destroy_cart_item
        @data=session[:cart_data]
        @data.delete(params[:id])
        redirect_to carts_path
    end


    def payment
        if session[:user_id]
            @data=params[:data]
            item_ids=@data.keys
            @items=Item.where(id: item_ids)
            @total_amount = params[:total_amount].to_i
            @user_id=session[:user_id]
            @user=User.find_by(id: @user_id)
        
        end
    end
 

    



    
end