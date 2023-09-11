Rails.application.routes.draw do
  get 'home/index'  
  resources :nius do
    resources :comments
  end
  get 'nius/:id/comment_add' => 'nius#comment_add'
  get 'nius/:id/comment_new' => 'nius#comment_new'
  root to: 'home#index'

   
  devise_for :nius_users
  
end
