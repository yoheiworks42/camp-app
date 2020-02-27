class Location < ApplicationRecord
    before_save { self.postcode = postcode.downcase }#email属性を小文字に変換してアドレスの一意性を保証する
    validates :name, presence: true, length: { maximum: 100} #nameの検証
    validates :postcode, presence: true, length: { minimum: 6,maximum: 7}, #emailの検証
        uniqueness:{ case_sensitive: false} #アドレスの大文字小文字を無視した一意性を確認
    has_many :posts
end