Rails.application.routes.draw do
  devise_for :users,
  :controllers=>{:registrations=>'registrations', :confirmations => 'confirmations'}

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


get 'your_articles' => 'reservations#your_articles'
get '/your_reservations' => 'reservations#your_reservations'
get '/search' => 'pages#search'

end

