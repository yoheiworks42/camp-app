class AddColumnGeolngToLocation < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :geolng, :string
  end
end
