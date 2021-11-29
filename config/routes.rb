Rails.application.routes.draw do

  root to: "sessions#welcome"
  get '/login', to: "sessions#new"
  post 'login', to: "sessions#create"
  get "/signup", to: "users#new"
  
  get 'auth/:provider/callback', to: 'sessions#google_omniauth'
  get 'auth/failure', to: redirect('/')
  
  delete '/logout', to: "sessions#destroy"

  resources :updates
  resources :dogs do 
      resources :updates, only: [:new, :index]
  end
  resources :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
