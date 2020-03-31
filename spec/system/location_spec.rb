require "rails_helper"

#let(:location_a){FactoryBot.create(:location,name:"キャンプ場A",prefecture: "北海道"}
#let(:location_b){FactoryBot.create(:location,name:"キャンプ場B",prefecture: "青森県"}

describe "キャンプ場一覧", type: :system do
 describe "一覧表示" do
  before do
   get index_path
  end
  
  it"キャンプ場一覧ページが表示される"do
   expect(response.status).to eq(index_path)
  end
 end
 
 describe"登録されたキャンプ場が表示される"do
  before do
   location=FactoryBot.create( :location, name:"キャンプ場A",prefecture:"北海道")
   visit index_path
  end
  
  it"キャンプ場の表示"do
   expect(page).to have_content("キャンプ場A")
   expect(page).to have_content("北海道")
  end
 end

end