Rails.application.routes.draw do

  root 'welcome#index'

  # User Routes
  get 'login' => 'users#signin'
  post 'login' => 'users#login'
  get 'logout' => 'users#logout'

  get '/auth/facebook/callback' => 'users#fblogin'

  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :websites, only: [:index, :show]
  
  scope :dashboard, path: '/dashboard' do
    get 'home'  => 'dashboard#index'
    post 'home' => 'dashboard#index'
    post 'create' => 'dashboard#create'
    get 'images/upload' => 'images#new'
    post 'images/upload' => 'images#create'
    resources :contents, only: [:index, :edit, :update]
    resources :invitations
    resources :events
  end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
