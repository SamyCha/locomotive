Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users,
  :controllers=>{:registrations=>'registrations'},
  :omniauth_callbacks => 'omniauth_callbacks'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]

  resources :products do
    resources :reservations, only: [:create]
    resources :reviews, only: [:create, :destroy]
  end

  resources :photos

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  resources :contacts, only: [:new, :create]


  get 'your_articles' => 'reservations#your_articles'
  get '/your_reservations' => 'reservations#your_reservations'
  get '/search' => 'products#search'
  get '/slide' => 'products#slide'

end

