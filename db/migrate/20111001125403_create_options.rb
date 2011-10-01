class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :text
      t.integer :option_array_id

      t.timestamps
    end
  end
end
