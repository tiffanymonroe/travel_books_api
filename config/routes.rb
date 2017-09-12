Rails.application.routes.draw do
  root 'welcome#index'
  # resources :linkers

  resources :books, only: [:index, :show]
  resources :destinations, only: [:index, :show]

  resources :users, only: [:index, :show, :update, :destroy] do
    resources :books, only: [:index, :show, :create]
    resources :destinations, only: [:index, :show, :create]
  end

  resources :users do
    collection do
      post '/login', to: 'users#login'
    end
  end
end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
