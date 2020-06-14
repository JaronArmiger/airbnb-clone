Rails.application.routes.draw do
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
    resources :users
    
	root 'listings#index'
	get 'privacy_policy', to: 'static_pages#privacy_policy'

	resources :locations, only: [:index, :show, :new, :create]
	resources :listings
	resources :profile_pictures, only: [:new, :create]
	resources :images, only: [:new, :create]
end
