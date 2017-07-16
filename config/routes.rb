Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :tickets
  

  root 'sessions#new'
  
  match '/room',    to: 'users#show',       via: 'get'
  match '/signup',  to: 'users#new',        via: 'get'  
  match '/signin',  to: 'sessions#new',     via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  #match '/change_password',   to: 'app#change',  via: 'get'

end
