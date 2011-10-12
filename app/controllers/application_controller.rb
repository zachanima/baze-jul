class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_shop
  before_filter :redirect_invalid_user

  protected
  def after_sign_out_path_for(resource)
    @shop
  end

  private
  def find_shop
    param = params[:shop_id] || params[:id]
    @shop = Shop.find_by_link(param) || Shop.find_by_id(param)
  end

  def redirect_invalid_user
    if customer_signed_in? and not current_customer.shop == @shop
      redirect_to current_customer.shop
    end
  end
end
