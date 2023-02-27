Rails.application.routes.draw do
  devise_for :users
  resources :posts
  get 'counter', to: 'counter#show'
  post 'increment', to: 'counter#increment'
  post 'decrement', to: 'counter#decrement'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
