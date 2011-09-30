class RenameNameToTitleInShops < ActiveRecord::Migration
  def change
    rename_column :shops, :name, :title
  end
end
