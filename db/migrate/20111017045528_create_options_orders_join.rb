class CreateOptionsOrdersJoin < ActiveRecord::Migration
  def change
    create_table :options_orders, :id => false do |t|
      t.references :option
      t.references :order
    end
  end
end
