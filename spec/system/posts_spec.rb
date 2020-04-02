require rails helper
RSpec.describe "Posts",type: :system do
 describe "new" do
  before do
   let(:image) {"#{Rails.root}/app/assets/images/sample.jpg"}
   visit locations.1_path
  end
  
  it"有効な画像の投稿に成功"do
   attach_file "post_img",[image]
   click_button "投稿"
  
   expect(page).to have_content "投稿に成功しました"
  end
  
  it"データが空だとエラーを返す"do
   fill_in image:nill
   expect(page).to have_content "画像データを選択してください"
  end
  
  it"画像が作成されていないこと"do
  end
  
 end

 it"画像投稿に成功したら、該当ページに遷移する"do
  get locations/location.id
 end
 it"画像を投稿したら一覧に表示される"do
  expect().have_to include
 end


 it"失敗したら同じページにリロードされる"do
  expect(current_path).to eq(location.1_path)
 end
end