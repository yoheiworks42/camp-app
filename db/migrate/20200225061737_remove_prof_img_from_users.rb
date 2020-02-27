class RemoveProfImgFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :prof_img, :string
  end
end
