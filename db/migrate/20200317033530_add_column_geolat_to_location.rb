class AddColumnGeolatToLocation < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :geolat, :string
  end
end
