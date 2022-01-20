Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'diaries#index'
  resource :initial, only: [:new]
  resource :setting, only: [:show] do
    resource :profile, only: [:edit, :update]
  end

  resource :tutorial, only: [:show]
  resources :diaries do
    collection do
      get 'search'
    end
  end

  resource :intro, only: [:show]
  resource :analysis, only: [:show]
  resources :users
  resources :soliloquies
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  post 'logout' => 'user_sessions#destroy', :as => :logout
  post '/guest_login', to: 'user_sessions#guest_login'
end
