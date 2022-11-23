Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "home", to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :places do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :destroy, :edit, :update]
end
