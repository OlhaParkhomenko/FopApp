class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :fullname
      t.string :address
      t.string :status

      t.timestamps null: false
    end
  end
end
