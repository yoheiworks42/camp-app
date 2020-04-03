require "rails_helper"

RSpec.describe"Location", type: :request do
 describe"GET path check"do
  before do
   FactoryBot.create(:location, id:"1")
  end
  
  it"indexページのリクエストは正しいか"do
   get index_path
   expect(response.status).to eq(200)
  end
  
  it"追加ページのリクエストは正しいか"do
   get locations_path
   expect(response.status).to eq(200)
  end
  
  it"詳細ページのリクエストは正しいか"do
   get locations_id_path
   expect(response.status).to eq(200)
 end
 
  it"画像投稿ページのリクエストは正しいか"do
   get locations_id_post_path
   expect(response.status).to eq(200)
 end
end