Rails.application.routes.draw do
  root 'welcome#index'
  # resources :linkers

<<<<<<< HEAD
  # resources :books do
  #   collection do
  #     get '/books', to: 'books#index'
  #   end
  # end

  # resources :user do
=======
  resources :books, only: [:index, :show]
  resources :destinations, only: [:index, :show]
>>>>>>> 72b08a748bd0256f9396aab4bb2ad933b3c136e2

  resources :users, only: [:index, :show] do
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
