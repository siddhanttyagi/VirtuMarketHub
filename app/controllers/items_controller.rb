class ItemsController < ApplicationController
   

    def index
        if session[:user_id]
            @user=User.find_by(id: session[:user_id])
        end
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
            @order=Order.new
            @data=params[:data]
            item_ids=@data.keys
            @items=Item.where(id: item_ids)
            @total_amount = params[:total_amount].to_i
            @user_id=session[:user_id]
            @user=User.find_by(id: @user_id)
            @shop_id=session[:tempshop_id]
            @seller_id = Shop.find_by(id: @shop_id)&.seller_id


        
        end
    end

    def placeorder
        @order=Order.new(order_params)
        @order.user_id=session[:user_id]
        


        if @order.save
            redirect_to root_path, notice: "order placed succesfully"
        
        else
            render json: { error: 'Your error message here' }, status: :unprocessable_entity
          
          
        end
    end
 

    private
    def order_params
        params.require(:order).permit(:seller_id, :shop_id, :order_details, :payment_check, :amount)
    end
    def to_bool(str)
        str.downcase == 'true'
    end



    
end