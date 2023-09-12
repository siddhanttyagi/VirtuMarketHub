class ItemsController < ApplicationController
    def index
        @items=Item.where(shop_id: params[:shop_id])
    end
end