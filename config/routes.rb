Rails.application.routes.draw do
  resources :destinations
  resources :users do
    collection do
      post '/login', to: 'users#login'
    end
  end
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
