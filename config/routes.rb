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

  get 'signup'  => 'users#new' 
  resources :users

  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

end
