class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :fullname
      t.string :surname
      t.string :name
      t.string :middle_name
      t.string :raw_address
      t.string :zip_code
      t.string :address
      t.string :status
      t.references :category
      t.references :region

      t.timestamps null: false
    end
  end
end