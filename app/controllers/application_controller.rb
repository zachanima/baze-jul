class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def find_shop
    id = params[:shop_id] || params[:id]
    @shop = Shop.find_by_link(id) || Shop.find(id)
  end

  def redirect_invalid_user
    if customer_signed_in?
      customer_shop = current_customer.shop
      redirect_to customer_shop unless customer_shop == @shop
    end
  end
end
