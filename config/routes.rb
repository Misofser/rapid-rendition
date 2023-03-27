Rails.application.routes.draw do
  root "sketches#index"
  
  resources :sketches do
    resources :votes
  end
  
  resources :challenges
  
  get 'signup'  => 'users#new' 
  resources :users
  
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

end
