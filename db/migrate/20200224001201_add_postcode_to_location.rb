class AddPostcodeToLocation < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :postcode, :string
  end
end
