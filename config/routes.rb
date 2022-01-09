Rails.application.routes.draw do

root "sessions#home"

 get '/signup' => 'users#new'
 post '/signup' => 'users#create'

 #login route
 get 'login' => 'sessions#new' #displays login page
 post 'login' => 'sessions#create' #process login information

#logout route
 delete 'logout' => 'sessions#destroy'

#Omniauth Git
get "/auth/:provider/callback" => 'sessions#git'

#Omniauth Facebook
get "/auth/:provider/callback" => 'sessions#facebook'

resources :comments

resources :users do
  resources :pokemons, only: [:new, :create, :index,:show]
end
resources :pokemons do
  resources :comments, only: [:new,:create, :index, :show]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



