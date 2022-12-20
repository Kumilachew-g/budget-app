Rails.application.routes.draw do
  get 'home/index'
  resources :groups
  resources :entities
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "home#index"

  devise_scope :user do
    authenticated :user do
      root 'groups#new', as: :authenticated_root
    end

    unauthenticated do
      root "home#index", as: :unauthenticated_root
    end
  end
end
