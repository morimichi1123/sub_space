Rails.application.routes.draw do

  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/list',     to: 'spaces#list'
  get '/show',     to: 'spaces#show'
  get '/new',      to: 'spaces#new'


  get 'spaces/edit'
  get 'spaces/update'
  get 'spaces/create'
  get 'spaces/space_params'
  get 'spaces/destroy'

  resources :users
end
