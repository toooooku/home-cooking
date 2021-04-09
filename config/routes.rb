Rails.application.routes.draw do
  get 'blogs/index'
  devise_for :users
  root to: "recipes#index"

  resources :recipes, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :recipes do
    resources :comments, only: :create
  end
  resources :users, only: :show
  resources :refrigerators, only: [:index, :create, :destroy]
  resources :blogs, only: [:index, :new, :create, :show]
end

