class AddMicropostToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :micropost, :string
  end
end
