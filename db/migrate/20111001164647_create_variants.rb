class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.integer :option_array_id
      t.integer :product_id

      t.timestamps
    end
  end
end
