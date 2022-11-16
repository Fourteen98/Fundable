Rails.application.routes.draw do
  get 'splash/index'
  get 'users/index'
  get 'users/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "splash#index"
  resources :users, only: %i[index show]
end
