Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'diaries#index'
  resource :initial, only: [:new]
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  post 'logout' => 'user_sessions#destroy', :as => :logout
  post '/demo_login', to: 'user_sessions#demo_login'
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :trivia, only: [:index, :show]
  resource :regulation, only: [:terms, :privacy] do
    collection do
      get 'terms'
      get 'privacy'
    end
  end
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

  resource :analysis, only: [:show]
  resources :users
  resources :soliloquies
  get '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'
end
