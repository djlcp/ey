Rails.application.routes.draw do
  devise_for :users
  resources :requests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  get 'calendar', to: 'pages#calendar'
  get 'admin', to: 'hr/users#index'
  get 'accept', to: 'accept#approve'
  get 'reject', to: 'accept#reject'
  # delete 'hr/requests/:id', to: 'requests#destroy2', as: :delete_request

  namespace :hr do
  	resources :users
  end

  namespace :manager do
    resources :users
    resources :requests
  end

  resources :approval_requests, only: [:show] do
    post :approve
    post :reject
  end
end
