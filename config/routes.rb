Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root "home#top"
  get 'home/registration'
  resources :user, only: [:show, :edit, :update]do
    member do
      get 'profile'
      patch 'profile_update'
      get 'logout'
    end
  end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
