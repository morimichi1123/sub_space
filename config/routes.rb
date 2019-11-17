Rails.application.routes.draw do

  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/list',     to: 'spaces#list'
  get '/show',     to: 'spaces#show'
  get '/new',      to: 'spaces#new'

  resources :spaces do
    resources :reservations
  end

  resources :users
  resources :spaces
end
