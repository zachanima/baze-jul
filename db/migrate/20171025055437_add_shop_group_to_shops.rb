class AddShopGroupToShops < ActiveRecord::Migration
  def change
    add_column :shops, :shop_group_id, :integer
  end
end
