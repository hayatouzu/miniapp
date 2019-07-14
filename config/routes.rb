Rails.application.routes.draw do
  devise_for :users
  root 'reviews#index'
  resources :reviews, only: [:index, :new, :create, :destroy, :edit, :update]
end