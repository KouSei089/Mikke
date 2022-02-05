Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'diaries#index'
  resource :initial, only: [:new]
  resources :trivia, only: [:index, :show]
  resource :setting, only: [:show] do
    resource :profile, only: [:edit, :update]
  end

  resource :tutorial, only: [:show]
  resources :diaries do
    collection do
      post 'sentiment_confirm'
    end
    member do
      patch 'edit_sentiment_confirm'
    end
  end

  resource :intro, only: [:show]
  resource :analysis, only: [:show]
  resources :users
  resources :soliloquies
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  post 'logout' => 'user_sessions#destroy', :as => :logout
  post '/demo_login', to: 'user_sessions#demo_login'
end
