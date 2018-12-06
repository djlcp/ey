Rails.application.routes.draw do
  devise_for :users
  resources :requests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  get 'admin', to: 'hr/users#index'

  namespace :hr do
  	resources :users
  end

  resources :approval_request, only: [] do
    post :approve
    post :reject
  end
end
