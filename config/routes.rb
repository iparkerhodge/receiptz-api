Rails.application.routes.draw do
  post 'sign_up', to: 'users#create'
  post 'login', to: 'users#index'

  get 'receipts/:user_id/list', to: 'receipts#list'
  post 'receipts', to: 'receipts#create'
  post 'receipts/:id', to: 'receipts#update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
