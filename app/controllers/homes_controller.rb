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
    
    def new
        @item=Item.new
    end

    def itemadd
        @checker=true
        if session[:seller_id]
            seller_id = session[:seller_id]
            shop_id = Shop.find_by(seller_id: seller_id)&.id
      
            if shop_id
              # Create a new item and associate it with the seller and shop
              @item = Item.new(items_params)
              @item.seller_id = seller_id
              @item.shop_id = shop_id

              if @item.save
                @checker=true
                redirect_to root_path, notice: "Successfully created the account"
              else
                @checker=false
                render :sellersindex, status: :unprocessable_entity
              end
            end
        else
            @checker=false
            render :sellersindex, status: :unprocessable_entity
        end
    end
    

    private
    def items_params
        params.permit(:item_name, :quantity, :summary, :price)
    end
end