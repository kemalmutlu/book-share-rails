Rails.application.routes.draw do
  devise_for :users
  # Welcome Root
  root 'welcome#index'
  # Books Route
  resources :books, :except => [:index] do
    resources :comments
    resources :offers
  end
  #Offers List Route
  get '/offers', to: 'offers#list'

  # Dashboard Route
  resources :dashboard 
  # Users
  resources :users
end
