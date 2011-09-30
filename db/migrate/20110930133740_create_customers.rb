class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :department
      t.integer :shop_id

      t.timestamps
    end
  end
end
