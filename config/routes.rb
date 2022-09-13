Rails.application.routes.draw do
  resources :sessions 
  get "login" => 'sessions#new'
  get "signup" => 'users#new'
  get "current_user" => 'users#show'
  get "logout" => 'sessions#destroy'
  
  get '/auth/:provider/callback', to: 'authentications#creat'
  
  resources :users
  resources :blogs do
    resources :comments
    collection do 
      get :search
    end
  end
  root to: 'home#index'
  get "about" => 'home#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
