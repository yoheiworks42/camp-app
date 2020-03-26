require "rails_helper"

describe "ログインテスト",type: :system do
 before do
  @user = FactoryBot.create(:user, name:"ユーザーA", email:"email@example.com")
 end
 
 context"有効なログイン"do
  before do
   visit login_path
   fill_in "メールアドレス", with: "email@example.com"
   fill_in "パスワード",with:"password"
   click_button "ログインする"
  end
  it"ユーザー画面が表示"do
   expect(page).to have_content "ユーザーA"
  end
 end
end