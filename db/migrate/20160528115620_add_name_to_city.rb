class AddNameToCity < ActiveRecord::Migration
  def change
    add_column :cities, :city_name, :string
    add_index :cities, :city_name
  end
end
