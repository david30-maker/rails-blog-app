Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  root 'users#index'
  namespace :api, defaults: { format: :json } do
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :show, :new, :create, :destroy] do
        # resources :comments, only: [:index, :new, :create, :destroy]
        resources :likes, only: [:create]
     end
    end
  end
end
