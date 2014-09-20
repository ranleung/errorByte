Rails.application.routes.draw do
	
	root to: "sites#index"
	
	get '/signup', to: 'users#new'

	# get '/login', to: 'session#new'
 #  post '/login', to: 'session#create'
 #  post 'session/destroy', to: 'session#destroy' 

	resources :users
	resources :codes
	resources :sites
	resources :sessions
	resources :code_templates
	resources :site_templates
	resources :user_templates
	resources :session_templates

	match '*path' => redirect('/'), via: :get

end
