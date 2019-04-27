Rails.application.routes.draw do
  root 'welcome#index'

  # User Routes
  resources :users, only: [:new, :create, :edit, :update, :show]
  get 'login' => 'users#signin'
  post 'login' => 'users#login'
  # Dashboard Routes
  get 'dashboard' => 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
