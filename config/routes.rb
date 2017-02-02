Rails.application.routes.draw do
  resources :auth_bundle2objs
  resources :auth_bundles
  resources :auth_invoices
  resources :auth_invoicests
  resources :auth_paymethods
  resources :auth_order2objs
  resources :auth_orders
  resources :auth_ordersts
  resources :auth_paysts
	resources :imgs
	resources :user2positions
	resources :positions
	resources :profiles

	devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

	get 'my', to: 'my#index', :as => :my
    get 'login/:user_id/:code', to: 'we#login', :as => :login


	root 'we#index'

    namespace :authecom do
        get '/', to: 'authecom#index'
        get '/pay', to: 'authecom#pay'
		post 'paypalipn' => 'authecom#paypalipn', :as => :paypalipn
	end

    namespace :adm do
        get '/', to: 'adm#index'

        #user
        get 'users', to: 'adm#users'
        get 'importer', to: 'adm#importer'
        post 'importer', to: 'adm#importer'
        post 'add_by_email', to: 'adm#add_by_email'
        get 'csv/:name', to: 'adm#csv', :as => :csv

        get 'user/:user_id', to: 'adm#user', :as => :ad_user
        post 'user/:user_id', to: 'adm#user'

        post 'ajax_updater', to: 'adm#ajax_updater'
	end


	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
