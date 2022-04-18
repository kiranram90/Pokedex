Rails.application.routes.draw do

root "sessions#home"

 get '/signup' => 'users#new'
 post '/signup' => 'users#create'

 #login route
 get 'login' => 'sessions#new' #displays login page
 post 'login' => 'sessions#create' #process login information

#logout route
 delete 'logout' => 'sessions#destroy'




