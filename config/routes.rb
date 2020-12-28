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
  get  'dashboard/index', to: 'dashboard#index', as: 'dashboard_index'
  get 'dashboard/books', to: 'dashboard#books', as: 'dashboard_user_books'

  # Users
  resources :users
end
