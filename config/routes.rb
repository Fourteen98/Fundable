Rails.application.routes.draw do
  # get 'purchases/index'
  # get 'purchases/new'
  # get 'purchases/create'
  # get 'groups/index'
  # get 'groups/new'
  # get 'categories/index'
  # get 'categories/show'
  # get 'categories/new'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # devise
  devise_for :users

  # custom routes
  resources :users, only: %i[index show]
  resources :groups, only: %i[index show new create] do
    resources :purchases, only: %i[index show new create]
  end

  # Defines the root path route ("/")
  root "splash#index"
end
