module SessionsHelper
 #ユーザーのログイン
 def log_in(user)
  session[:user_id] = user.id
 end
 
 #ログイン中のユーザーを返す（どのページでも）
 def current_user
  if session[:user_id]
   @current_user ||= User.find_by(id: session[:user_id])
  end
 end
 
 #ユーザーがログインしていればtrue、出なきゃfalse
 def logged_in?
  !current_user.nil?
 end
 
 #ログアウト
 def log_out
  session.delete(:user_id)
  @current_user = nil #@current_userの中身を空にしないとsessionが止まらん
 end
 
end