Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'

  resources :nius
  devise_for :nius_users
  
end
