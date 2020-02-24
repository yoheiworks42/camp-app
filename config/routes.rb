Rails.application.routes.draw do

  root 'locations#home'
  get "/signup",to:'users#new'
  post "/signup",to:"users#create"
  get "/login", to:'sessions#new' #コントローラ名と連動してる
  post "/login",to:'sessions#create'
  delete "/logout",to:'sessions#destroy'

  resources :users #これどういう意味？



  get "/index",to:'locations#index'
  get "/detail",to:'locations#show'
  get "/sugest",to:'locations#new'
  post "/sugest",to:'locations#create'
  
  resources :locations



end