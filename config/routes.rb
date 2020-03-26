Rails.application.routes.draw do
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
    end
  end
  resources :relationships, only: [:create, :destroy]
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
