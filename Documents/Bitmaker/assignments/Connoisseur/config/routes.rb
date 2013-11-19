Connoisseur::Application.routes.draw do
  root :to => 'home#index'
  resources :products
  resources :stores
end
