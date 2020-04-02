class Post < ApplicationRecord
 mount_uploader :post_img, ImgUploader
 #serialize :post_img, JSON
 belongs_to :user#, class_name: 'user', :foreign_key => 'user_id'
 belongs_to :location#, class_name: 'location', :foreign_key => 'location_id'
 validates :user_id, presence: true
 validates :location_id, presence: true
 validates :post_img, presence: true#, length:{ maximum: 3}
 #validates :micropost,presence: true, length:{ maximum: 30}
 
end