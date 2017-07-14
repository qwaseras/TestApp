Rails.application.routes.draw do
  resources :users

  root "users#new"

    match '/room',              to: 'app#room',   via: 'get'
    match '/change_password',   to: 'app#change',   via: 'get'


  get 'app/change'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
