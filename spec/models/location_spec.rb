require "rails_helper"

RSpec.describe Location, type: :model do
  before do
   @location=FactoryBot.create(:location)
  end
  
  it "factory_botが有効かどうか"do
   location=@location
   expect(location).to be_valid
  end
  
  it "名称とgeoコードがあれば登録が有効"do
   location=FactoryBot.build(:location,
   name: "hoge",
   geolat: "0",
   geolng:"0"
   )
   expect(location).to be_valid
  end
  
  it "キャンプ場名が空欄だと登録が無効" do
   location = FactoryBot.build(:location, name: nil)
   location.valid?
   expect(location.errors[:name]).to include "キャンプ場の名称を入力してください" 
  end

  it "地図が指定されていないと登録が無効" do
   location = FactoryBot.build(:location, geolat: nil)
   location.valid?
   expect(location.errors[:geolat]).to include "地図上で場所をクリックしてください" 
  end  
  
end