Rails.application.routes.draw do
  root "sketches#index"

  resources :sketches do
    resources :votes do
      member do
        delete :destroy
      end
    end
  end

  resources :challenges do
    member do
      get 'challenge_sketches', to: 'challenges#challenge_sketches'
    end
  end

  resources :challenges
  
  resources :users
  get 'signup'  => 'users#new' 
 

  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

end
