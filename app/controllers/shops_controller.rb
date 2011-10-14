class ShopsController < ApplicationController
  before_filter :find_shop
  before_filter :authenticate_customer!
  before_filter :redirect_invalid_user

  # def show
end
