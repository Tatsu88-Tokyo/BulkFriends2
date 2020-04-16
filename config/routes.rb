Rails.application.routes.draw do
  get 'trainings/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root "home#top"
  get 'home/registration'
  resources :user, only: [:show, :edit, :update]do
    member do
      get 'profile'
      patch 'profile_update'
      get 'logout'
      get 'friends'
      get 'search'
      get :following, :followers
        resources :trainings, only: [:index, :create,:show,:destroy,:new,:edit,:update]
        resources :mygyms, only: [:index, :create,:show,:destroy,:new,:edit,:update]
        resources :messages, only: [:index, :create]
        namespace :api do
          resources :messages, only: :index, defaults: { format: 'json' }
        end
    end
  end
  resources :relationships, only: [:create, :destroy]
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
