FactoryBot.define do
 factory :post do
  #post_img "/sample.jpg"
  micropost {"message"}
  user
 end
end