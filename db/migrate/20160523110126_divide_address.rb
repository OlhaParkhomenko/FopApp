class DivideAddress < ActiveRecord::Migration
  def change
    add_column :people, :index, :string
    add_index :people, :index
    add_column :people, :region, :string
    add_index :people, :region
    add_column :people, :reduce_address, :string
    add_index :people, :reduce_address
  end
end
