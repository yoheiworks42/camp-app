class RenamePostPostImgColumnToLocations < ActiveRecord::Migration[5.1]
  def change
    rename_column :locations, :post_post_img, :top_img
  end
end
