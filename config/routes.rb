Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:index, :new, :show, :create, :edit,:update, :destroy]
  resource :category, to: 'products#category', path: 'category/:id', only: :show
end
