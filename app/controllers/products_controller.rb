class ProductsController < ApplicationController
  before_filter :find_shop
  before_filter :authenticate_customer!
  before_filter :redirect_invalid_user

  def index
    @products = @shop.products
  end

  def show
    @product = @shop.products.find params[:id]
  end
end
