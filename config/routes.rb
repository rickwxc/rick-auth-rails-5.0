Rails.application.routes.draw do
	resources :user2positions
	resources :position2permissions
	resources :permissions
	resources :positions
	resources :profiles

	devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

	get 'my', to: 'my#index', :as => :my

	root 'we#index'

    namespace :adm do
        get '/', to: 'adm#index'

        #user
        get 'users', to: 'adm#users'
        get 'user/:user_id', to: 'adm#user', :as => :ad_user
        post 'user/:user_id', to: 'adm#user'

	end


	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
