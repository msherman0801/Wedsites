Rails.application.routes.draw do

  root 'welcome#index'

  # User Routes
  get 'login' => 'users#signin'
  post 'login' => 'users#login'
  get 'logout' => 'users#logout'

  get '/auth/facebook/callback' => 'users#fblogin'

  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :websites, only: [:index, :create, :show, :edit, :update] do 
    get '/image/:id' => 'websites#image', as: "image"
    post '/invitations' => 'websites#search'
  end
  
  scope :dashboard, path: '/dashboard' do
    get 'home'  => 'dashboard#index'
    post 'home' => 'dashboard#index'
    post 'create' => 'dashboard#create'
    resources :images, only: [:index, :new, :create, :show, :destroy]
    resources :contents, only: [:index, :edit, :update]
    resources :invitations, only: [:index, :new, :create, :update, :destroy]
    resources :events, only: [:index, :new, :edit, :create, :show, :update, :destroy]
  end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
