Tagliners::Application.routes.draw do

  match "/token", to: "session#create", via: :post
  resources :users
  resources :achievements
  root to: 'application#index'


end
