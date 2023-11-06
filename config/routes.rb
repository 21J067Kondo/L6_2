Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get "amazon/index"
  post "/delete", to: "amazon#delete"
  get '/add', to: "amazon#add"
  get '/look', to: "amazon#look"
  get '/cin', to: "amazon#cin"
  get '/cart', to: "amazon#cart"
  post '/amazon/regist', to:'amazon#regist'
  post '/amazon/cartin', to: 'amazon#cartin'
  post '/amazon/cart', to:'amazon#cart'
  post '/cdel', to: "amazon#cdel"
  root "amazon#index"
  # root "articles#index"
end
