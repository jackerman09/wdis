SampleApp::Application.routes.draw do
  resources :users
  resources :sessions,      only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :teams
  resources :players
  resources :matchups
  
  match '/',        to: 'static_pages#home',    via: 'get'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/updatepts', to: 'static_pages#updatepts', via: 'get'
  match '/findMatchup', to: 'static_pages#findMatchup', via: 'get'
  # match '/getUserNumCredits', to: 'static_pages#getUserNumCredits', via: 'get'
  match '/getRandomMatchup',  to: 'static_pages#getRandomMatchup', via: 'get'

  root :to => 'static_pages#home'
end
