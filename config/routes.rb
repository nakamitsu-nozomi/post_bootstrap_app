Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts do
    resource :likes,only:[:create,:destroy]
  end  
  get "users/search", to: "users#search"
  resources :users, only: :show
  resources :relationships, only:[:create,:destroy]
  resources :users do
    member do
      get :following, :followers
    end
  end
 
end
