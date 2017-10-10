Rails.application.routes.draw do
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'auth/:provider/callback',  to: 'sessions#create'
  get 'auth/failure',             to: redirect('/')
  get 'signout',                  to: 'sessions#destroy', as: 'signout'

  resources :users, only: [:show]
end
