# frozen_string_literal: true

Rails.application.routes.draw do
  resources :meetings
  ActiveAdmin.routes(self)
  devise_for :users,
  controllers: { registrations: 'registrations' },
  omniauth_callbacks: 'omniauth_callbacks'

# suppression d'un utilisateur par admin
match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]

  resources :products do
    resources :reservations, only: [:create]
    resources :reviews, only: %i[create destroy]
  end

  resources :photos

  resources :conversations, only: %i[index create] do
    resources :messages, only: %i[index create]
  end

  resources :contacts, only: %i[new create]
  resources :meetings

  get 'your_articles' => 'reservations#your_articles'
  get '/your_reservations' => 'reservations#your_reservations'
  get '/search' => 'products#search'
  get '/slide' => 'products#slide'
  get '/admindashboard' => 'pages#admindashboard'
  get '/contact' => 'pages#contact'
  get '/quisommesnous' => 'pages#qui'

  get '/rating' => "reviews#rating"
  get '/mini_index' => 'products#mini_index'

# Participation to a meeting
  get 'participate' => 'meetings#participate'


# admindashbooard: fast publication seller/product/review
  patch '/publish_product/:id' =>'pages#publish_product', as: :publish_product
  patch '/user_to_seller/:id' =>'pages#user_to_seller', as: :user_to_seller
  patch '/publish_review/:id' =>'pages#publish_review', as: :publish_review
end
