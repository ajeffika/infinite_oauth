Rails.application.routes.draw do
  resources :users
  root to: "pages#index"
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  delete '/logout', to: 'sessions#destroy'
end
