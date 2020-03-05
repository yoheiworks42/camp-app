class LocationsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def index
    @locations = Location.all.order(created_at: :desc)
    #@post = Post.all.order(created_at: :desc)
    @post = Post.find_by(location_id: 2)
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end
  
  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:success]="キャンプ場を追加しました"
      redirect_to @location
    else
      render "new"
    end
  end

  def update
  end

  def home
  end
  
  # beforeアクション
  #ユーザーがログイン済みかどうか
  def logged_in_user
    unless logged_in?
      flash[:danger]="ログインしてください"
      redirect_to login_url
    end
  end
  
  private
  
  def location_params #どういう機能だ？
    params.require(:location).permit(:name, :postcode, :address)
  end

end
