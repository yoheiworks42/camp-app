class AddColumnPrefectureToLocation < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :prefecture, :text
  end
end
