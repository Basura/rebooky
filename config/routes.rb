Rails.application.routes.draw do
  resources :inquiries, only: [:index, :show]
  resources :properties, :contacts
  devise_for :users, path_names: { registration: 'registration' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # Sendgrid parse route
  post 'sendgrid/mails'

  root to: 'home#index'
  resources :users
end
