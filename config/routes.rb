Rails.application.routes.draw do

  root 'static_pages#home'
  get "/signup",to:'users#new'
  post "/signup",to:"users#create"
  get "/login", to:'sessions#new' #コントローラ名と連動してる
  post "/login",to:'sessions#create'
  delete "/logout",to:'sessions#destroy'
  resources :users




  get "/index",to:'static_pages#index'

  get "/show",to:'static_pages#show'



end