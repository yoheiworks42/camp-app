class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.text :name
      t.text :address

      t.timestamps
    end
  end
end
