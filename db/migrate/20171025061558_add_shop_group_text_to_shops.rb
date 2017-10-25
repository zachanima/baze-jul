class AddShopGroupTextToShops < ActiveRecord::Migration
  def change
    add_column :shops, :shop_group_text, :string
  end
end
