require "rails_helper"

RSpec.describe"Location", type: :request do
 describe"GET path check"do
  before do
   FactoryBot.create(:location, id:"1")
  end
  
  it"indexページが表示されること"do
   get index_url
   expect(response.body).to include "キャンプ場一覧"
  end
  
  it"追加ページが表示されること"do
   get locations_1_url
   expect(response.body).to include "キャンプ場を追加する"
  end
  
  it"mapページが表示されること"do
   get map_url
   expect(response.body).to include "全国のキャンプ場"
  end 
  
   it"詳細ページのリクエストは正しいか"do
    get detail_url
    expect(response.body).to include "同志の森"
   end

 end
end