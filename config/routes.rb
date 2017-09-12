Rails.application.routes.draw do
  root 'welcome#index'
  # resources :linkers

  # commented out for testing, most likely need
  # resources :books
  # resources :destinations
  # commented out end

  resources :books, only: [:index, :show]
  resources :destinations, only: [:index, :show]
  resources :users, only: [:index, :show] do
    resources :books, only: [:create, :show, :index]
    resources :destinations, only: [:create, :show, :index]

    end
  # end

  # resources :books do
  #   collection do
  #     get '/books', to: 'books#index'
  #   end
  # end

  # resources :user do

  resources :users do
    collection do
      post '/login', to: 'users#login'
        # resources :books, only: [:index, :show, :create]
        # resources :destinations, only: [:index, :show, :create]
      # post '/post', to: 'users#create'
    end

  end
  end
