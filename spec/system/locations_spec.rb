require "rails_helper"

describe "Location", type: :system do
 before do
  FactoryBot.create(:user)
  FactoryBot.create(:location)
  visit login_path
  fill_in "メールアドレス", with: "email@example.com"
  fill_in "パスワード",with:"password"
  click_button "ログイン"
 end
 
 describe"Get #index"do
  before do
   visit index_path
  end
  
  it"キャンプ場追加の表示"do
   expect(page).to have_content("キャンプ場を追加する")
  end
 end

 describe "Search"do  
  scenario"キーワード検索と一致するものだけを表示"do
   visit index_path
   fill_in 'search',with:"山梨県"
   find('#search').send_keys(:enter)
   expect(page).to have_content "山梨県"

   fill_in "search",with:"同志の森"
   find("#search").send_keys(:enter)
   expect(page).to have_content "同志の森"
  end
 end

 describe"Get #location"do
  before do
   visit location_path([:id],id:1)
  end
  
  it"詳細が表示される"do
   expect(page).to have_content "同志の森"
  end
 end
  
  describe"ログインしている場合"do
   it"投稿ボタンが表示されること"do
    expect(page).to have_content"投稿"
   end
  end
end