Rails.application.routes.draw do
  devise_for :admins, :controllers => { :sessions => 'admins/sessions'
  }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'home#index'
  devise_for :users, :controllers => { :registrations => 'registrations',
                                       omniauth_callbacks: 'users/omniauth'
  }


  post '/auth/:provider/callback' => 'authentications#create'
  resources :users do
    collection do
      get :update_user_profile
    end
  end
  resources :technicians
  resources :orders
  resources :biddings
  resources :jobs do
    collection do
      get :search_jobs
    end
      get :delete_picture, :on => :collection, :action => 'delete_picture'
  end
  resources :contractors
  resources :contractor_services
  resources :employers
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
    end
  end
  resources :messages, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
