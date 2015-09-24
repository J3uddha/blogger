Rails.application.routes.draw do
	root to: 'articles#index'
  resources :articles do
  		resources :comments
	end

	resources :tags
	resources :authors
	resources :author_sessions, only: [ :new, :create, :destroy ]

	#the following lines do not use RESTful conventions -- this is how you make your own routes
	get 'login'  => 'author_sessions#new'
	get 'logout' => 'author_sessions#destroy'
end
