Rails.application.routes.draw do

  get "/signup",to:'users#new'

  get 'users/show'

  #get 'static_pages/home'

  root 'static_pages#home'

  get "/index",to:'static_pages#index'

  get "/show",to:'static_pages#show'

  #get 'static_pages/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
