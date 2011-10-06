class AddLogoToShops < ActiveRecord::Migration
  def change
    add_column :shops, :logo_file_name, :string
    add_column :shops, :logo_content_type, :string
    add_column :shops, :logo_file_size, :integer
    add_column :shops, :logo_updated_at, :datetime
  end
end
