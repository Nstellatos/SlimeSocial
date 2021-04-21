Rails.application.routes.draw do
  
  get 'sessions/new'
  resources :recipes
  root 'static_pages#home'

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
