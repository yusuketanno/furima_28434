Rails.application.routes.draw do
  devise_for :users
  
 root to: "items#index"
 get 'items/search1'
 get 'items/search2'
 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:edit, :update]
  resources :items do
    resources :purchases, only: [:index, :create]
  end
  
end
