class ProductsController < ApplicationController
  def index
    @shop = Shop.find params[:shop_id]
    @products = @shop.products
  end

  def show
    @shop = Shop.find params[:shop_id]
    @product = @shop.products.find params[:id]
  end
end
