Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'

  resources :posts do
    resources :comments, only: :create
  end

  resources :users

  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

end
