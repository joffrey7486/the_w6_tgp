Rails.application.routes.draw do
  get 'home/', to: 'home#show'
  root to: 'home#show'
  get 'welcome/', to: 'welcome#show'
  get '/welcome/:user_entry', to: 'welcome#show'
  get 'team/', to: 'team#show'
  get 'contact/', to: 'contact#show'
  get '/profile/:id', to: 'profile#show', as: 'profile'
  get '/profile/', to: 'profile#show'
  get '/gossip/:id', to: 'gossip#show', as: 'gossip'
  get '/gossip/', to: 'gossip#show'
end
