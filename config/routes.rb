Rails.application.routes.draw do

  root 'locations#home'
  get "/test",to:"locations#test" #テスト用ページ
  
  get "/signup",to:'users#new'
  post "/signup",to:"users#create"
  get "/login", to:'sessions#new' #コントローラ名と連動してる
  post "/login",to:'sessions#create'
  delete "/logout",to:'sessions#destroy'

  resources :users

  get "/index",to:'locations#index'
  get "/detail",to:'locations#show'
  get "/sugest",to:'locations#new'
  post "/sugest",to:'locations#create'
  resources :locations

  get "/postindex",to:'posts#index' #あくまでバグの確認用
  get "/locations/:id/post",to:"posts#new"
  post "/locations/:id/post",to:"posts#create"
  
  resources :posts

end