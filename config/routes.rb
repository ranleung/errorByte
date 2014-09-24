Rails.application.routes.draw do
	
	root to: "sites#index"
	
	# get '/signup', to: 'users#new'

	# get '/abouts', to: 'about#index'
	get '/login', to: 'session#new'
	get '/logged_in_user', to: "session#logged_in_user"
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy' 
  
	resources :users
	resources :codes
	resources :sites
	resources :sessions
	resources :completes
	resources :intermediates
	resources :code_templates
	resources :site_templates
	resources :user_templates
	resources :about_templates
	resources :intermediate_templates
	resources :session_templates
	
	match '*path' => redirect('/'), via: :get
end
