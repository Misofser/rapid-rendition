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
      get 'challenge_sketches' => 'challenges#challenge_sketches'
    end
  end

  resources :users
  get 'signup'  => 'users#new' 
 
  get 'privacy_policy' => 'static_pages#privacy_policy'

  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

end
