require "rails_helper"

RSpec.describe"画像投稿",type: :model do

  it"有効なデータなら登録されること"do
   post = FactoryBot.build(:post)
   post.valid?
   expect(post).to be_valid?
  end
end