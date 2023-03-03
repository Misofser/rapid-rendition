Rails.application.routes.draw do
  root "sketches#index"
  
  resources :sketches do
    resources :votes
  end

  get 'signup'  => 'users#new' 
  resources :users
  
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  resources :challenges

end
