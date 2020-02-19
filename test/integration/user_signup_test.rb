require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
#無効なユーザー登録のチェック。投稿と登録がごっちゃになっていないか
  test "invaild signup information" do
    get signup_path
    assert_no_difference "User.count"do
      #以下こう言う記述はエラーですよ、って意味のサンプル
      post users_path, params: { user: { name:"",
        email:"invalid@example",
        password:"hoge",
        password_confirmation:"huga"}}
    end
    assert_template "users/new"    
  end
#有効なユーザー登録チェック  
  test "vaild signup information" do
    get signup_path
    assert_difference "User.count",1 do
      post users_path, params: { user: { name:"user1",
        email:"user1@example.com",
        password:"password",
        password_confirmation:"password"}}
    end
    follow_redirect!
    assert_template "users/new"
    #新規登録したユーザーがログインできているか確認
    assert is_logged_in?
  end
end