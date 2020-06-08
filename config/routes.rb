Rails.application.routes.draw do
    devise_for :users
	root 'static_pages#home'
	resources :locations, only: [:index, :show, :new, :create]
	resources :listings

	namespace :create_listing do

	end

end
