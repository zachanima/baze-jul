class AddLinkToShopGroups < ActiveRecord::Migration
  def change
    add_column :shop_groups, :link, :string
  end
end
