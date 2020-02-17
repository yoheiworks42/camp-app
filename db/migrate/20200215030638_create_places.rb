class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.text :name
      t.text :address

      t.timestamps
    end
  end
end
