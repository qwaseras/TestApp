Rails.application.routes.draw do
  root "app#registration"

    match '/room',              to: 'app#room',   via: 'get'
    match '/change_password',   to: 'app#change',   via: 'get'


  get 'app/change'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
