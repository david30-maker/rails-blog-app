Rails.application.routes.draw do
  devise_scope :user do
    root to: 'registrations#new'
  end

  devise_for :users, controllers: { registrations: 'registrations' }
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:index, :new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:index, :show]
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:index, :new, :create, :destroy]
    end
  end
end
