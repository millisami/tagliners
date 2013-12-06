Tagliners::Application.routes.draw do

  resources :users
  resources :achievements
  root to: 'application#index'

end
