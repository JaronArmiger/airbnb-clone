Rails.application.routes.draw do
    resources :users
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
	root 'static_pages#home'
	get 'privacy_policy', to: 'static_pages#privacy_policy'
	resources :locations, only: [:index, :show, :new, :create]
	resources :listings

end
