class AddColumnPostPostImgToLocation < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :post_post_img, :string
  end
end
