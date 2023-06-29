Rails.application.routes.draw do
root 'users#index'
resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      # resources :comments, only: [:create]
      member do
        post 'like'
      end
    end
  end
end
