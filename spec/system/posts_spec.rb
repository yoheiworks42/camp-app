require "rails_helper"
RSpec.describe "Posts",type: :system do
 describe "new" do
  before do
   FactoryBot.create(:location)#, top_img:"#{Rails.root}/app/assets/images/camping-691424_1280.jpg")
   #let(:image) {"#{Rails.root}/app/assets/images/camping-691424_1280.jpg"}
  end
  
  it"投稿ページが表示されること"do
   get /locations/id/post path
   expect(page).to have_content("写真を投稿する")
   #expect(response.status).to eq(200)
  end

 end
end