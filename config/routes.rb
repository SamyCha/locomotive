Rails.application.routes.draw do
  devise_for :users,
  :controllers=>{:registrations=>'registrations'}

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users, only: [:show]

resources :products do
  resources :reservations, only: [:create]
end

resources :photos

get 'your_articles' => 'reservations#your_articles'
get '/your_reservations' => 'reservations#your_reservations'

end

