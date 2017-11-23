Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, :controllers => { :registrations => 'registrations',
                                       omniauth_callbacks: 'users/omniauth'
  }
  resources :users
  resources :technicians
  resources :orders
  resources :biddings
  resources :jobs do
      get :delete_picture, :on => :collection, :action => 'delete_picture'
  end
  resources :contractors
  resources :contractor_services
  resources :employers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
