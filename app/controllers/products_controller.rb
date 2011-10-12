class ProductsController < ApplicationController
  before_filter :authenticate_customer!

  def index
    @products = @shop.products
  end

  def show
    @product = @shop.products.find params[:id]
  end
end
