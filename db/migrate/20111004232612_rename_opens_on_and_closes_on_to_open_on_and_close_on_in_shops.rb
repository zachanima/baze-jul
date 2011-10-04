class RenameOpensOnAndClosesOnToOpenOnAndCloseOnInShops < ActiveRecord::Migration
  def change
    rename_column :shops, :opens_on, :open_on
    rename_column :shops, :closes_on, :close_on
  end
end
