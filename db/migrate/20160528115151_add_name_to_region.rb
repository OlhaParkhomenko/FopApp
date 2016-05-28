class AddNameToRegion < ActiveRecord::Migration
  def change
    add_column :regions, :region_name, :string
    add_index :regions, :region_name
  end
end
