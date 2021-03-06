FactoryBot.define do
factory :location do
  id {"1"}
  name {"同志の森キャンプ場"}
  postcode {"111-2222"}
  prefecture {"山梨県"}
  address {"佐世保市殿町1-2-3"}
  geolat {"0"}
  geolng {"0"}
  top_img {Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/factories/sample.jpg"))}
 end
end