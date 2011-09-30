class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :slug
      t.string :username_text
      t.string :password_text
      t.text :text
      t.date :opens_on
      t.date :closes_on
      t.string :locale

      t.timestamps
    end
  end
end
