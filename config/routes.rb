Rails.application.routes.draw do

  root 'locations#home'

  get "/signup",to:'users#new'
  post "/signup",to:"users#create"
  get "/login", to:'sessions#new'
  post "/login",to:'sessions#create'
  delete "/logout",to:'sessions#destroy'

  resources :users

  get "/test",to:"locations#test"
  get "/index",to:'locations#index'
  get "/detail",to:'locations#show'
  get "/sugest",to:'locations#new'
  post "/sugest",to:'locations#create'
  get "/map",to:'locations#map'
  resources :locations

  get "/locations/:id/post",to:"posts#new"
  post "/locations/:id/post",to:"posts#create"
  get "/hoge",to:"posts#hoge"
  resources :posts

end