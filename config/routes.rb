Rails.application.routes.draw do

  # Root Route
  root 'welcome#index'

  # Session Routes
  get 'login' => 'users#signin'
  post 'login' => 'users#login'
  get 'logout' => 'users#logout'

  # OAuth Routes
  get '/auth/facebook/callback' => 'users#fblogin'
  
  # User Routes
  resources :users, only: [:new, :create, :edit, :update, :show]

  # Public Website Routes
  resources :websites, only: [:index, :create, :show, :edit, :update] do 
    resources :invitations
    get '/image/:id' => 'websites#image', as: "image"
    #post '/invitations' => 'websites#search'
  end
  
  # Admin Dashboard
  scope :dashboard, path: '/dashboard' do
    get 'home'  => 'dashboard#index'
    post 'home' => 'dashboard#index'
    post 'create' => 'dashboard#create'
    resources :images, only: [:index, :new, :create, :show, :destroy]
    resources :contents, only: [:index, :edit, :update]
    resources :invitations, only: [:new, :create, :destroy]
    resources :events, only: [:index, :new, :edit, :create, :show, :update, :destroy]
  end

end
