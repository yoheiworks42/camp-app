class User < ApplicationRecord
 before_save { self.email = email.downcase }#email属性を小文字に変換してアドレスの一意性を保証する
 validates :name, presence: true, length: { maximum: 50} #nameの検証
 validates :email, presence: true, length: { maximum: 255}, #emailの検証
  uniqueness:{ case_sensitive: false} #アドレスの大文字小文字を無視した一意性を確認
 has_secure_password #PWの暗号化
 validates :password, presence: true, length:{minimum: 6} #PW最低6文字な
 # =>validates :message, presence: true, length:{ maximum: 140} #messageの検証


 mount_uploader :img, ImgUploader
 has_many :posts
   #validates   :img_size　#投稿は5MB以下に。
 
 private
 
 def img_size
  if img.size > 5.megabytes
   errors.add(:img, "5MB以下にしてください")
  end
 end
end