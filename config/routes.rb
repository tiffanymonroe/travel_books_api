Rails.application.routes.draw do
  root 'welcome#index'
  resources :linkers
  resources :books
  resources :destinations

  resources :users do
    collection do
      post '/login', to: 'users#login',
      post '/post', to: 'users#create',

  resources :user do
    collection do
      patch '/users/:id', to: 'users#update',
      put '/users/:id', to: 'users#update',
      delete '/users/:id', to: 'users#destroy'
    end
  end
    end
  end
end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
