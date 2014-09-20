Rails.application.routes.draw do
	root to: "sites#index"
	resources :users
	resources :codes
	resources :code_templates
	resources :sites
	resources :site_templates
	resources :user_templates

	match '*path' => redirect('/'), via: :get

end
