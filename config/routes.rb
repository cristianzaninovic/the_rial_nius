Rails.application.routes.draw do
  get 'home/index'  
  get 'nius/comment_add' => 'nius#comment_add'
  get 'nius/:id/comment_new' => 'nius#comment_new'
  root to: 'home#index'

  resources :nius
  devise_for :nius_users
  
end
