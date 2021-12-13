Rails.application.routes.draw do
  root 'diaries#index'
  resource :initial, only: [:new]
  # resource :setting, only: [:show] do
  #   resource :profile, only: [:edit, :update]
  #  end
  resource :settings, only: [:show] do
    resource :profile, only: [:edit, :update]
  end

  resource :tutorials
  # resource :tutorial
  resources :diaries do
    collection do
      get 'search'
    end
  end

  resource :intros
  # resource :intro
  resource :analysis
  resources :users
  resources :soliloquies
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
