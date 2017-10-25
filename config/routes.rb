Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, :controllers => { :registrations => 'registrations' }
  resources :users
  resources :technicians
  resources :orders
  resources :biddings
  resources :jobs
  resources :contractors
  resources :employers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
