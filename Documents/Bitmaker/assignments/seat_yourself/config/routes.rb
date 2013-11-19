SeatYourself::Application.routes.draw do
  get "signup" => 'users#new', :as => "signup"
  get "login" => 'sessions#new', :as => "login"
  get "logout" => 'sessions#destroy', :as => "logout"
  root :to => 'restaurants#index'
  resources :users
  resources :restaurants
  resources :reservations
  resources :sessions
end
