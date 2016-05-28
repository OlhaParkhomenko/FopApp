class DivideAddress < ActiveRecord::Migration
  def change
    add_column :people, :zip_code, :string
    add_index :people, :zip_code
    add_column :people, :string
    add_index :people, 
    add_column :people, :address, :string
    add_index :people, :address
  end
end
