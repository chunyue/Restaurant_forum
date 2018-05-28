Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]

    
    collection do
      get :feeds #瀏覽所有餐廳的最新動態

      get :ranking #最多人追蹤的餐廳
    end  

    member do 
      get :dashboard #瀏覽個別餐廳的Dashboard
      
      post :favorite 
      post :unfavorite

      post :like
      post :unlike
    end  


  end

  resources :categories, only: :show
  root "restaurants#index"

  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end

  resources :users, only: [:index, :show, :edit, :update]

  resources :followships, only: [:create, :destroy]


end
