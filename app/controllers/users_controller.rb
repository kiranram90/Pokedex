class UsersController < ApplicationController

def new
    @user = User.new
end

def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        redirect_to @user
    else
        flash.now[:notice] = "Username or Email already exist in Pokedex"
        render :new
end
end


