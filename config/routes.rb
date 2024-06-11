Rails.application.routes.draw do
  root 'user_backoffice/tasks#index'

  namespace :user_backoffice do
    resources :tasks
    resources :tasks do
      patch 'complete', on: :member
      patch 'shared', on: :member
      get 'shared_tasks', on: :collection
    end
    resources :list_shareds
    get 'home/index'
  end
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
