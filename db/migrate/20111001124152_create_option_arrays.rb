class CreateOptionArrays < ActiveRecord::Migration
  def change
    create_table :option_arrays do |t|
      t.string :title
      t.string :text

      t.timestamps
    end
  end
end
