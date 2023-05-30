Rails.application.routes.draw do
  get 'charge/index'
  post 'charge', to: 'charge#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
