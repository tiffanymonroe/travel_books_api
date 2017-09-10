Rails.application.routes.draw do
  root 'welcome#index'
  resources :linkers
  resources :books
  resources :destinations

  resources :users do
    collection do
      post '/login', to: 'users#login'
    end
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
