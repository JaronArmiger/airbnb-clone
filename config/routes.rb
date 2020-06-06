Rails.application.routes.draw do
  get 'location/new'
  get 'location/create'
    devise_for :users
	root 'static_pages#home'
end
