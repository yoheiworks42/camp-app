class Post < ApplicationRecord
    mount_uploader :post_img, ImgUploader
    belongs_to :user#, class_name: 'user', :foreign_key => 'user_id'
    belongs_to :location#, class_name: 'location', :foreign_key => 'location_id'
    validates :user_id, presence: true
    validates :location_id, presence: true
end