class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :brand
      t.text :text
      t.integer :shop_id

      t.timestamps
    end
  end
end
