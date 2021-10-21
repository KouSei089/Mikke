Rails.application.routes.draw do
  root 'diaries#index'
  resource :initials
  resource :settings
  resource :tutorials
  resources :diaries
  resource :analysis
  resources :users
  resources :soliloquies
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
