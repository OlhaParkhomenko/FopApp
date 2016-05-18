class DivideFio < ActiveRecord::Migration
  def change
    add_column :people, :surname, :string
    add_index :people, :surname
    add_column :people, :name, :string
    add_index :people, :name
    add_column :people, :middle_name, :string
    add_index :people, :middle_name
  end
end
