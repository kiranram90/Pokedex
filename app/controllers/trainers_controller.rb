class TrainersController < ApplicationController

def new
    @user = User.new
end

def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        redirect_to @user

    else
        render :new
end

def show
end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
