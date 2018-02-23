Rails.application.routes.draw do
  get 'payment/new'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  get "listings/search"
  
  get "listings/verify"
  
  resources :listings do
    resources :reservations
  end

  resources :users, controller: "users", only: [:create, :show] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  
  get "/auth/facebook" => "sessions#create_from_omniauth"
  
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"


  get "/users/reservations" => "reservations#user_index", as: "user_reservations"

  
  get 'payment/new'

  post 'payment/checkout'

end
