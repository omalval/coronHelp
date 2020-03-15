Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  resources :reservations, only: [:new, :create] do
    member do
      post 'change_status'
    end
  end

  get "/my_gardes", to: "gardes#view_my_gardes", as: "my_gardes"
  get "/my_garde/:id", to: "gardes#view_my_garde", as: "my_garde"
  get "/my_reservations", to: "reservations#view_my_reservations", as: "my_reservations"


  resources :gardes do

    resources :garde_categories, only: [:new, :create]

  end

    # resources :meal_categories, only: [:new, :create]
    # resources :meal_ingredients, only: [:new, :create]
    # resources :reviews, only: [ :new, :create ]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
