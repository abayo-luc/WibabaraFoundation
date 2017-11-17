Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#index'

  resources :events
  resources :contacts, :only => [:index, :new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
