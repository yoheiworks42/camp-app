class PostsController < ApplicationController
    before_action :logged_in_user, only:[:new, :create]

 def index
     @posts = Post.order(updated_at: :desc).limit(1)
 end

 def new
     @post = Post.new
 end
 
 def create
     @post = Post.new(post_params)
     @post.user_id = current_user.id # user_idの情報はフォームからはきていないので、deviseのメソッドを使って「ログインしている自分のid」を代入
        if @post.save
            flash[:success]="写真を投稿しました"
            redirect_to "/locations/#{@post.location_id}"
        else
            flash[:danger]="投稿に失敗しました"
            render "new"
        end
 end
    
#beforeアクション
    def logged_in_user
        unless logged_in?
            flash[:danger]="ログインしてください"
            redirect_to "login_url"
        end
    end
    
    private
    
    def post_params
        params.require(:post).permit(:post_img, :location_id)
    end
end
