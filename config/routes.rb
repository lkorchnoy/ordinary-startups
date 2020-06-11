Rails.application.routes.draw do
  resources :categories
  resources :users
  resources :startups 
  resources :categories do 
    resources :startups 
  end

  root 'users#home'
  
  get '/auth/facebook/callback', to: "sessions#fb_create"
  get '/auth/github/callback', to: "sessions#github_create"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
