require "rails_helper"

RSpec.describe Location, type: :model do
 let(:image_path) { Rails.root.join("spec/factories/sample.jpg")}
 let(:image) { Rack::Test::UploadedFile.new(image_path) }

 it "登録が有効なこと"do
   location=FactoryBot.create(:location)
   expect(location).to be_valid
  end
  
  it "キャンプ場名が空欄だと無効なこと" do
   location = FactoryBot.build(:location, name: nil)
   location.valid?
   expect(location.errors[:name]).to include "を入力してください" 
  end

  it "地図が指定されていないと無効なこと" do
   location = FactoryBot.build(:location, geolat: nil)
   location.valid?
   expect(location.errors[:geolat]).to include "で場所をクリックしてください" 
  end  
  
  it"top_imgがないと無効なこと"do
   location=FactoryBot.build(:location, top_img: nil)
   location.valid?
   expect(location.errors[:top_img]).to include"を入力してください"
  end
  
end