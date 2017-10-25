class CreateShopGroups < ActiveRecord::Migration
  def change
    create_table :shop_groups do |t|
      t.string :title

      t.timestamps
    end
  end
end
