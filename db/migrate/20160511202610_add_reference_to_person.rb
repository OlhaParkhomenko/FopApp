class AddReferenceToPerson < ActiveRecord::Migration
  def change
    add_reference :people, :category, index: true, foreign_key: true
    add_reference :people, :region, index: true, foreign_key: true
  end
end
