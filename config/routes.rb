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
  get  "sellers/shop", to: "homes#addmyshop"
  post "addshop", to: "homes#shopadd"
  get '/shops/:shop_id/items', to: 'items#index', as: 'shop_items'
  post "cart", to: 'items#cart'
  get "carts", to: 'items#carts'
  post 'destroyitemcart', to: 'items#destroy_cart_item'
  get 'payment', to: 'items#payment'

  post 'orders', to:'items#placeorder'
  get 'searchshop', to: 'homes#search'
  post 'search', to:'homes#searchpost'
  post '/shops/:shop_id/search', to: 'homes#searchpost'
  get 'profile', to: 'users#profile'
  get 'updateprofile', to: 'users#update'
  put 'editprofile', to: 'users#editprofile'
  get 'sellersorder', to: 'sellers#myorder'
  get 'searchitems', to: 'homes#searchitems'
  root "homes#index"
  
end
