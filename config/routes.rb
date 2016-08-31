Rails.application.routes.draw do
  resources :user2positions
  resources :position2permissions
  resources :permissions
  resources :positions
	resources :profiles
	devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

	get 'my', to: 'my#index', :as => :my

	root 'we#index'

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
