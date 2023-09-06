Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "signup", to: "users#index"
  post "signup", to: "users#create"
  delete "logout", to: "sessions#destroy"
  root "homes#index"
  
end
