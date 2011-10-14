class Customer::SessionsController < Devise::SessionsController
  before_filter :find_shop
  before_filter :set_locale

  private
  def after_sign_in_path_for(resource)
    @shop
  end

  def after_sign_out_path_for(resource)
    @shop
  end
end
