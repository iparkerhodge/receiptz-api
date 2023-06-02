Rails.application.routes.draw do
  post 'sign_up', to: 'users#create'

  get 'charge/index'
  post 'charge', to: 'charge#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
