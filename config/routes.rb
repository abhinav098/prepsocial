Rails.application.routes.draw do
  get 'oauth/create'

  get 'oauth/destroy'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

  get 'password_resets/new'

  get 'password_resets/edit'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/privacy', to: 'static_pages#privacy'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get  '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  #omni auth
  get 'oauth/create', to: 'oauth#create'
  get 'oauth/destroy', to: 'oauth#destroy'
  get 'auth/:provider/callback', to: 'oauth#create'
  get 'auth/failure', to: redirect('/')

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]

end

