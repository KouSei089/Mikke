Rails.application.routes.draw do
  root 'diaries#index'
  resource :diaries
end
