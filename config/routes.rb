Rails.application.routes.draw do
  resources :users do
    member do 
      get :confirm_email
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :tickets
  

  root 'sessions#new'
  
  match '/room',              to: 'users#show',       via: 'get'
  match '/signup',            to: 'users#new',        via: 'get'  
  match '/signin',            to: 'sessions#new',     via: 'get'
  match '/signout',           to: 'sessions#destroy', via: 'delete'
  match '/change_password',   to: 'users#edit',        via: 'get'
  match '/answer' ,           to: 'tickets#new_subticket', via: 'get'
  match '/send_answer' ,      to: 'tickets#create_subticket', via: 'post'
  

end
