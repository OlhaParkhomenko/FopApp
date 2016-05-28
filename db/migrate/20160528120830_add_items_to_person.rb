class AddItemsToPerson < ActiveRecord::Migration
  def change
    add_column :people, :zip_code, :string
    add_index :people, :zip_code
    add_column :people, :raw_address, :string
    add_index :people, :raw_address
  end
end
