Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'log_out', to: 'sessions#destroy', as: 'log_out'

  resources :sessions
  resources :home
  resources :posts
  resources :users
  resources :searches
  resources :relationships
  resources :followings
  resources :followers
  resources :user_searches
end
