require "rails_helper"

RSpec.describe"user", type: :model do
 it"有効なuserが登録できること"do
  expect(FactoryBot.build(:user)).to be_vaild
 end
 
 it"名前がなければ無効なこと"do
  user=FactoryBot.build(:user,name: nil)
  user.valid?
  expect(user.errors[:name]).to include("ユーザー名を入力してください")
 end

 it"メールアドレスがなければ無効なこと"do
  user=FactoryBot.build(:user,email: nil)
  user.valid?
  expect(user.errors[:email]).to include("メールアドレスを入力してください")
 end
 
 it"メールアドレスが重複したら無効なこと"do
 FactoryBot.create(:user ,email: "test@example.com")
  user=FactoryBot.build(:user,email: "test@example.com")
  user.valid?
  expect(user.errors[:email]).to include("メールアドレスはすでに存在します")
 end
 
  it"パスワードがなければ無効なこと"do
  user=FactoryBot.build(:user,password: nil)
  user.valid?
  expect(user.errors[:password]).to include("パスワードを入力してください")
 end
 
  it"パスワードが6文字未満なら無効なこと"do
  user=FactoryBot.build(:user,password: "passw")
  user.valid?
  expect(user.errors[:password]).to include("パスワードは6文字以上で入力してください")
 end
 
 it"確認用パスワードが一致しないなら無効なこと"do
  user=FactoryBot.build(:user,password: "password",password_confirmation:"testtest")
  user.valid?
  expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
 end
 
end