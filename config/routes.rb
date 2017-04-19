Rails.application.routes.draw do
  resources :properties, :contacts
  devise_for :users, path_names: { registration: 'registration' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  resources :users
end
