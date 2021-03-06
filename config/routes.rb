Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'neighbourhood#index'

  resources :neighbourhood, only: [:index, :show] do
    resources :event, except: [:index] do
      resources :comment, only: [:create, :destroy]
    end
    resources :assistance, except: [:index] do
      resources :comment, only: [:create, :destroy]
    end
    resources :meeting
    resources :notice
  end

  # resources :user, only: [:new, :create] do
  # end

  get :register, to: 'users#new'
  post :register, to: 'users#create'

  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'

  namespace :admin do
    root to: 'dashboard#show'
    resources :user, only: [:edit, :destroy]
    resources :poll, only: [:create, :edit, :destroy]
  end

end
