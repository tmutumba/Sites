Rails.application.routes.draw do
	
	#root "demo/index"

	match ':controller(/:action(/:id(.:format)))', :via => :get  

  	#get 'demo/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
