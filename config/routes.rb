Rails.application.routes.draw do
  root to: 'home#index'
  resources :home
  resources :welcome
  resources :team
  resources :contact
  resources :gossip
  resources :profile
end
