class RenameSlugToLinkInShops < ActiveRecord::Migration
  def change
    rename_column :shops, :slug, :link
  end
end
