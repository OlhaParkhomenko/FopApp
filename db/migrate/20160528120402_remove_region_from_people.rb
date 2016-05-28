class RemoveRegionFromPeople < ActiveRecord::Migration
  def change
     remove_column :people, :region, :string
     remove_column :people, :index, :string
     remove_column :people, :reduce_address, :string
  end
end
