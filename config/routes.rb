Rails.application.routes.draw do
  get 'dashboard/show'

  get 'login',   to: 'sessions#new',     as: 'login'
  get 'signup',  to: 'users#new',        as: 'signup'
  get 'logout',  to: 'sessions#destroy', as: 'logout'

  resources :sessions
  resources :users

  root 'dashboard#show'

end
