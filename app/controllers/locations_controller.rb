class LocationsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def test
  end

  def index
    @locations = Location.all.order(created_at: :desc)
    @locations = Location.search(params[:search])
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
  
  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @locations = Location.search(params[:search])
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
    params.require(:location).permit(:name, :postcode, :prefecture,:address, :top_img)
  end

end
