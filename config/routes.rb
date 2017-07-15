Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :tickets, only: [:new, :create, :edit]
  

  root "users#new"
  
  match '/room',    to: 'users#show',       via: 'get'
  match '/signin',  to: 'sessions#new',     via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/ticket', to: 'tickets#new',   via: 'get'  
  #match '/change_password',   to: 'app#change',  via: 'get'

end
