class AddIndexToForeignIds < ActiveRecord::Migration
  def change
    add_index :customers, :shop_id
    add_index :options, :option_array_id
    add_index :products, :shop_id
    add_index :variants, :option_array_id
    add_index :variants, :product_id
    add_index :variations, :option_id
    add_index :variations, :product_id
  end
end
