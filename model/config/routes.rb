Rails.application.routes.draw do
  resources :tables
  get 'comments/create'

  get 'comments/destroy'

  resources :posts do
    collection do
      get 'all'
    end
  end
  devise_for :users
  get 'home/index'

  root 'home#index'

  resources :users do
    resources :posts
  end

  resources :posts do
    resources :tables
    resources :comments , only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
