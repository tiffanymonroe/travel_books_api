Rails.application.routes.draw do
  root 'welcome#index'
  # resources :linkers
  resources :books
  resources :destinations

  # resources :user do


  resources :users do
    collection do
      post '/login', to: 'users#login'
        resources :books, only: [:index, :show, :create]
        resources :destinations, only: [:index, :show, :create]
      # post '/post', to: 'users#create'
    end

  end
  end





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html




  # rails routes does not like the following line:
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'
