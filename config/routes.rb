Rails.application.routes.draw do
  
	root to: "codes#index"
	resources :users
	resources :codes
	resources :code_templates

end
