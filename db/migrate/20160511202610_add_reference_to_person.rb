class AddReferenceToPerson < ActiveRecord::Migration
  def change
    add_reference :people, :category, zip_code: true, foreign_key: true
  end
end
