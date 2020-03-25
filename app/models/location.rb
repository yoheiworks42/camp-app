class Location < ApplicationRecord
 mount_uploader :top_img, ImgUploader
 before_save { self.postcode = postcode.downcase }#属性を小文字に変換してアドレスの一意性を保証する
 #validates :name, presence: true, length: { maximum: 100}
 #validates :postcode, presence: true, length: { minimum: 8,maximum: 8},
 # uniqueness:{ case_sensitive: false} #アドレスの大文字小文字を無視した一意性を確認
 has_many :posts
 #validates :geolat, presence: true
 #validates :geolng, presence: true
 
 validate :add_error_sample
 
 def add_error_sample
  if name.blank?
   errors[:base] <<"キャンプ場の名称を入力してください"
  end
  
  if geolat&&geolng.blank?
   errors[:base] <<"地図上で場所をクリックしてください"
  end
 end
 def self.search(search)
  if search
   Location.where(["name Like ? or prefecture Like ?","%#{search}%","%#{search}%"])
  else
   Location.all
  end
 end
end
