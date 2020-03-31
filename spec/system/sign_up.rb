require "rails_helper"
 describe "ユーザーの新規登録",type: :system do
  before do
   visit signup_path
  end
  
 describe "有効なユーザーの場合"do
   before do
    fill_in "ユーザー名",with:"user1"
    fill_in "メールアドレス",with:"user1@example.com"
    fill_in "パスワード",with:"password"
    fill_in "確認用パスワード",with:"password"
    click_button "登録する"
   end
   it "登録されたらユーザーAのページを表示する" do
    expect(page).to have_content "user1"
  end
 end
 
 describe"無効なユーザーの場合"do
   before do
    fill_in "ユーザー名",with:""
    fill_in "メールアドレス",with:""
    fill_in "パスワード",with:""
    fill_in "確認用パスワード",with:""
    click_button "登録する"
   end
   it"エラーメッセージを表示"do
    expect(page).to have_content "確認してください"
   end
 end
end