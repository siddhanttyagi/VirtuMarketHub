class HomesController < ApplicationController

    
    def index
        if session[:user_id]
            @user=User.find_by(id: session[:user_id])
        end
        @shops=Shop.all
    end
    def sellersindex
        @checker3=false
        if session[:seller_id]
            @user=Seller.find_by(id: session[:seller_id])
        end   
    end
        
    
    def addmyshop
        if session[:seller_id]
            @user=Seller.find_by(id: session[:seller_id])
        end
    end
    
    def itemadd
        @checker=true
        @checkmate=false
        if session[:seller_id]
            seller_id = session[:seller_id]
            shop_id = Shop.find_by(seller_id: seller_id)&.id
             
            if shop_id
              # Create a new item and associate it with the seller and shop
              @item = Item.new(items_params)
              @item.seller_id = seller_id
              @item.shop_id = shop_id
              flash[:notice] = "Item added successfully."
              if @item.save
                @checker=true
                render :sellersindex, notice: "Successfully created the account"
              else
                @checker=false
                render :sellersindex, status: :unprocessable_entity
              end
            else
                @checker=false
                redirect_to sellers_shop_path
            end
        else
            @checker=false
            render :sellersindex, status: :unprocessable_entity
        end
    end

    
    def shopadd
        
        @checker=true
        if session[:seller_id]
            
            seller_id=session[:seller_id]
            @shop=Shop.new(shop_params)
            @shop.seller_id=seller_id
            if @shop.save
                redirect_to sellers_home_path
                @checker=true
            else
                @checker=false
                render :addmyshop, status: :unprocessable_entity
                
            end
        end
        
    end
    

    private
    def items_params
        params.permit(:item_name, :quantity, :summary, :price, :image)
    end

    def shop_params
        params.permit(:shop_name,:shop_summary,:shop_image)
    end
end