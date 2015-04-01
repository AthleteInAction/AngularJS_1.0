Rails.application.routes.draw do

	# API
  	namespace :api do
  		namespace :v1 do

  			# API INSERT

  		end
  	end

	root 'main#index'
	post '/',to: 'main#create'

	get '/access/signout',to: 'sessions#destory', as: 'signout'
	get '/access/normal',to: 'sessions#new', as: 'login'
	post '/access/normal',to: 'sessions#create'

end