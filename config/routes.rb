Rails.application.routes.draw do

  get 'subjects/index'
  get 'subjects/show'
  get 'subjects/new'
  get 'subjects/edit'
  get 'subjects/delete'

  get 'pages/index'
  get 'pages/show'
  get 'pages/new'
  get 'pages/edit'
  get 'pages/delete'

	root "demo#index"

	match ':controller(/:action(/:id(.:format)))', :via => [:get, :post, :patch]

  	#get 'demo/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
