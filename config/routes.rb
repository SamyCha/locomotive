# frozen_string_literal: true

Rails.application.routes.draw do
  get 'search/index' => 'search#index'

  resources :meetings

resources :users, only: [:index]

  ActiveAdmin.routes(self)
  devise_for :users,
  controllers: { registrations: 'registrations' },
  omniauth_callbacks: 'omniauth_callbacks'

#Listing of all users




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

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
    collection do
      delete :empty_trash
    end
  end

  resources :messages, only: [:new, :create]

  resources :contacts, only: %i[new create]

  resources :meetings
  resources :meetings do
    post :participate
  end

  get 'all_products' => 'products#all_products'
  get 'your_articles' => 'reservations#your_articles'
  get '/your_reservations' => 'reservations#your_reservations'
  get '/search' => 'products#search'
  get '/slide' => 'products#slide'
  get '/admindashboard' => 'pages#admindashboard'
  get '/conditions' => 'pages#conditions'
  get '/quisommesnous' => 'pages#qui'
  get '/concept' => 'pages#concept'
  get '/devenir_vendeuse' => 'pages#devenir_vendeuse'

  get '/rating' => "reviews#rating"
  get '/mini_index' => 'products#mini_index'

# admindashbooard: fast publication seller/product/review
patch '/publish_product/:id' =>'pages#publish_product', as: :publish_product
patch '/user_to_seller/:id' =>'pages#user_to_seller', as: :user_to_seller
patch '/publish_review/:id' =>'pages#publish_review', as: :publish_review
end
