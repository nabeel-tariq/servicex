Rails.application.routes.draw do
  resources :users
  resources :technicians
  resources :orders
  resources :biddings
  resources :jobs
  resources :contractors
  resources :employers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
