require "rails_helper"

#let(:location_a){FactoryBot.create(:location,name:"キャンプ場A",prefecture: "北海道"}
#let(:location_b){FactoryBot.create(:location,name:"キャンプ場B",prefecture: "青森県"}

describe "Location", type: :system do
 describe"Get #index"do
  before do
   location=FactoryBot.create( :location, name:"キャンプ場A",prefecture:"北海道")
   visit index_path
  end
  
   it"キャンプ場一覧ページが表示される"do
   expect(response.status).to eq(index_path)
  end
  
  it"キャンプ場の表示"do
   expect(page).to have_content("キャンプ場A")
   expect(page).to have_content("北海道")
  end
 end
 
 describe"Get #location"do
  before do
   location=FactoryBot.create( :location, name:"キャンプ場A",prefecture:"北海道",location_id:"1")
   #location=FactoryBot.create(:location name:"キャンプ場A",postcode:"123-4567",prefecture:"北海道",address:"B市C区D町123",location_id:"1")
   visit location.location_id_path
  end
  
  it"詳細が表示される"do
   expect(page).to have_content
  end
  
 describe "Search"do
  before do
   location=FactoryBot.create( :location, name:"キャンプ場A",prefecture:"北海道")
   visit index_path
  end
  
  scenario"キーワード検索と一致するものだけを表示"do
   fill_in "search",with:"北海道"
   find("#search").send_keys(:enter)
   expect(page).to have_content "北海道"
   
   fill_in "search",with:"キャンプ場A"
   find("#search").send_keys(:enter)
   expect(page).to have_content "キャンプ場A"
  end
 end
end