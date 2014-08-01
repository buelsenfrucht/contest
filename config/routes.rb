Rails.application.routes.draw do

  get 'dashboard/show'

  get 'login',   to: 'sessions#new',     as: 'login'
  get 'signup',  to: 'users#new',        as: 'signup'
  get 'logout',  to: 'sessions#destroy', as: 'logout'

  resources :sessions

  resources :users do
    resources :milestones, :except => :show
    resources :goals, :except => [:show, :update, :edit] do
      get 'starting_point'
      post 'starting_point' => 'milestones#starting_point'
    end
  end

  root 'dashboard#show'

end
