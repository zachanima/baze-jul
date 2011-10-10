class ShopsController < ApplicationController
  def show
    @shop = Shop.find_by_link params[:id]
  end
end
