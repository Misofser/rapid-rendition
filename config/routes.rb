Rails.application.routes.draw do
  root "sketches#index"
  resources :sketches do
    resources :votes
  end
end
