Rails.application.routes.draw do

  get 'sessions/new'
  root 'static_pages#home'

  get '/help',    to: 'static_pages#help'
  get '/about',    to: 'static_pages#about'
  get '/contact',    to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get '/login', to:'sessions#create'

  delete '/logout', to:'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :microposts,          only: [:create, :destroy]
   resources :relationships,       only: [:create, :destroy]
end
