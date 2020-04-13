require "rails_helper"
RSpec.describe "Posts",type: :system do
 describe "new" do
  before do
   user = FactoryBot.create(:user)
   sign_in user 
   FactoryBot.create(:location)
   visit new_post_path
  end
  
  it"写真投稿ページが表示されること"do
   expect(page).to have_content("写真を投稿する")
  end
  
  it"写真が空だとエラーを返すこと"do
   fill_in image:nil
   expect(page).to have_content "を入力してください"
  end

 end
end