Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "signup", to: "users#index"
  post "signup", to: "users#create"
  get "login", to: "users#read"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "offers", to: "offers#index"
  get "newshops", to: "newshops#index"
  get "trending", to: "trendings#index"

  get "sellers/login", to: "sellers#read"
  get "sellers/signup", to: "sellers#index"
  post "sellers/signup", to: "sellers#create"
  post "sellers/login", to: "sessions#createseller"
  get "sellers/home", to: "homes#sellersindex"
  delete "sellers/logout", to: "sessions#sellerdestroy"

  post "additems", to: "homes#itemadd"

  



  root "homes#index"
  
end
