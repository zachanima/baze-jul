class RenameOpenOnAndCloseOnToOpensOnAndClosesOnInShops < ActiveRecord::Migration
  def change
    rename_column :shops, :open_on, :opens_on
    rename_column :shops, :close_on, :closes_on
  end
end
