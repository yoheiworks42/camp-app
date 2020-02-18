Rails.application.routes.draw do

  get "/signup",to:'users#new'
  post "/signup",to:"users#create"

  get 'users/show'

  #get 'static_pages/home'

  root 'static_pages#home'

  get "/index",to:'static_pages#index'

  get "/show",to:'static_pages#show'

  resources :users

end