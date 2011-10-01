class CreateVariations < ActiveRecord::Migration
  def change
    create_table :variations do |t|
      t.integer :option_id
      t.integer :product_id

      t.timestamps
    end
  end
end
