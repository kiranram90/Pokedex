class SessionsController < ApplicationController

   
    def new
    end


    def create
        user = User.find_by(username: user_params[:username])
         if user && user.authenticate(user_params[:password])
          session[:user_id] = user.id
          redirect_to pokemons_path
        else
          flash.now[:notice] = "Incorrect login info, please try again"
          redirect_to "/login"
        end
    end

    

    def facebook
      @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
        user.username = auth["info"]["first_name"]
        user.password = SecureRandom.hex(10)
      end
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to pokemons_path
      end  
    end

    def destroy
        session.clear
        redirect_to '/'
    end

    private

    def user_params
      params.require(:user).permit(:email,:username, :password)
    end

    def auth
      request.env['omniauth.auth']
    end

end