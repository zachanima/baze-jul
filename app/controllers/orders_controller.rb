class OrdersController < ApplicationController
  before_filter :find_shop
  before_filter :authenticate_customer!
  before_filter :redirect_invalid_user

  def create
    @order = Order.new params[:order]
    @order.save
    redirect_to @shop
  end
end
