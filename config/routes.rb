Rails.application.routes.draw do
    devise_for :users
    resources :users
	root 'static_pages#home'
	get 'privacy_policy', to: 'static_pages#privacy_policy'
	resources :locations, only: [:index, :show, :new, :create]
	resources :listings

	namespace :create_listing do

	end

end
