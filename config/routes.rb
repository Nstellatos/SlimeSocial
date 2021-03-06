Rails.application.routes.draw do

  root 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'

  resources :recipes do 
    resources :reviews 
  end
  

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
