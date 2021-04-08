Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"

  resources :recipes, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :recipes do
    resources :comments, only: :create
  end
end

