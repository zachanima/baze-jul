class ShopGroupsController < ApplicationController
	layout "group"

	def show
		id = params[:id]
		@group = ShopGroup.find_by_link(id)
		if @group.nil? or @group.shops.count == 0 # fallback to shop
			find_shop
			redirect_to @shop
		elsif @group.shops.count == 1
			redirect_to @group.shops.first
		end
	end
end
