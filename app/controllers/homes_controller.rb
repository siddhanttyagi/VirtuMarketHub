class HomesController < ApplicationController

    
    def index
        if params[:category2]
            @items=Item.where(category2: params[:category2])
        elsif params[:category1]
            @items=Item.where(category1: params[:category1])
        elsif params[:item_name]
            @items=Item.where(item_name: params[:item_name])
            @items1=Item.where(category1: @items.first.category1)
            @items2=Item.where(category2: @items.first.category2)

        elsif params[:shop_name]
            @shops=Shop.where(shop_name: params[:shop_name])
            @items=Item.where(shop_id: @shops.first.id)

        else
            if session[:user_id]
                @user=User.find_by(id: session[:user_id])
            end
            @shops=Shop.all
            @items=Item.all
            @rating_map={}
            @shopRating_map={}
            @items.each do |item|
                itemratings=Rating.where(item_id: item.id)
                sum=0
                count=0
                itemratings.each do |items|
                    sum=sum+items.rating
                    count+=1
                end
                @rating_map[item.id]=(sum.to_f/count).round(1)
            end
            session[:rating_map] = @rating_map
            @shops.each do |shop|
                allitems=Item.where(shop_id: shop.id)
                sum=0
                count=0
                allitems.each do |item|
                    sum+=@rating_map[item.id].to_i
                    count+=1
                end
                @shopRating_map[shop.id]=(sum.to_f/count).round(1)
            end
            puts @shopRating_map
            # puts @rating_map

            



        end
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

    def search
        shop_id=params[:id]
        @shop=Shop.find(shop_id)
        item_name=params[:item_name]
        @itemsMatch=Item.where('lower(item_name) LIKE ?', "%#{item_name.downcase}%")
        @items=Item.where(shop_id: shop_id)
        
        

    end

    def searchitems
        item_name=params[:item_name]
        @items=Item.where('lower(item_name) LIKE ?', "%#{item_name.downcase}%")
        
        
        
    end

    def searchpost
        item_name=params[:shop_name]
        shop_name=params[:shop_name]
        @shops=Shop.where('lower(shop_name) LIKE ?', "%#{shop_name.downcase}%")
        @items=Item.where('lower(item_name) LIKE ?', "%#{item_name.downcase}%")
        @items_category1=Item.where('lower(category1) LIKE ?', "%#{item_name.downcase}%")
        category1=[]
        @items_category1.each do |item|
            category1.push(item.category1)
        end
        category1=category1.uniq
        @items_category2=Item.where('lower(category2) LIKE ?', "%#{item_name.downcase}%")
        category2=[]
        @items_category2.each do |item|
            category2.push(item.category2)
        end
        category2=category2.uniq
        respond_to do |format|
            
            format.turbo_stream do
                render turbo_stream: turbo_stream.update("search_results",partial: "homes/search_results", locals: {items: @items, item_name: item_name, items_category1: category1, items_category2: category2, shop_name: shop_name, shops: @shops})
                
            end
        end
        
        # item_name=params[:shop_name]
        # shop = Shop.find_by('lower(shop_name) LIKE ?', "%#{shop_name.downcase}%")
        # if shop
        #     redirect_to searchshop_path(id: shop.id, item_name: item_name)
        
        # else
        #     redirect_to searchitems_path(item_name: item_name)
        # end
        

        

    end
    

    private
    def items_params
        params.permit(:item_name, :quantity, :summary, :price, :image)
    end

    def shop_params
        params.permit(:shop_name,:shop_summary,:shop_image)
    end
end