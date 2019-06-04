Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:index, :new, :show, :create, :edit,:update, :destroy]
  resource :category, to: 'products#category', path: 'category/:id', only: :show
  resource :userpage, to: 'products#userpage', path: 'userpage/:id', only: :show
  resource :likes, to: 'likes#create', path: 'likes/:product_id/create', only: :create, as: 'like'
  resource :likes, to: 'likes#destroy', path: 'likes/:product_id/destroy', only: :destroy, as: 'unlike'
end
