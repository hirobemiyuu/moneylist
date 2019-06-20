Rails.application.routes.draw do
  root to: 'titles#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  resources :titles
  resources :items, only: [:new, :create, :edit, :update, :destroy]
end