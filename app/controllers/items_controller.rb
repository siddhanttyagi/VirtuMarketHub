class ItemsController < ApplicationController
   

    def index
        @items=Item.where(shop_id: params[:shop_id])
    end

    def cart
        if session[:user_id]
            session[:cart_data] ||= {}
            item_id=params[:item_id]
            session[:cart_data][item_id]=params[:quantity]
        end
        
        
        

    end

    def carts
        if session[:user_id]
            @data=session[:cart_data]
            item_ids=session[:cart_data].keys
            @items=Item.where(id: item_ids)
        end
    end

    def destroy_cart_item
        @data=session[:cart_data]
        @data.delete(params[:id])
        redirect_to carts_path
    end
 

    



    
end