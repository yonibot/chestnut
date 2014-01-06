
Chestnut2::Application.routes.draw do

  root to: 'static_pages#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :friends_library_items

  get '/admin', to: 'admin/sessions#index'

  namespace :admin do
    resources :sessions
  end

  resources :books, only: [:create, :destroy]

  resources :users, only: [] do
    resources :library_items, only: [:index, :create, :destroy]
  end

  get '/find', to: 'library_items#find'

  resources :blog_posts

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :users, only: [] do
        resources :library_items, only: [:index, :create, :destroy]
      end
    end
  end


end
