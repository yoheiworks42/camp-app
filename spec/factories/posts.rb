FactoryBot.define do
 factory :post do
  post_img { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/factories/sample.jpg")) }
  location_id {"1"}
  user
 end
end