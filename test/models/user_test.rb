#circle ciで省きたいけど、テストは理解しておくべき
require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user=User.new(name:"sample",email:"sample@example.com",
      password: "foobar", password_confirm:"foobar") #PWとPW確認を追加する
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  #空欄ならエラー
  test "name should be present" do
    @user.name="  "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email="  "
    assert_not @user.valid?
  end

  #文字が長すぎたらエラー
  test "name should not be too long" do
    @user.name = "a"*51
    assert_not @user.valid?
  end
  
  test "email should not be too long" do
    @user.email = "a"*244
    assert_not @user.valid?
  end
  
  #アドレスが重複したらエラー
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase #大文字小文字を区別しない一意性の確認
    @user.save
    assert_not duplicate_user.valid?
  end
  
  #PW欄に記載があるか
  test "password should be present(nonblank)"do
    @user.password = @user.password_confirm =""*6
    assert_not @user.valid?
  end

  #PWの文字数が足りているか  
  test "password should have a minimum length" do
    @user.password = @user.password_confirm ="a"*5
    assert_not @user.valid?
  end
end