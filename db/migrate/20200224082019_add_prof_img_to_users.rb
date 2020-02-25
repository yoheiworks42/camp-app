class AddProfImgToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :prof_img, :string
  end
end
