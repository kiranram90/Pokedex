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

    def destroy
        session.clear
        redirect_to '/'
    end

    private

    def user_params
      params.require(:user).permit(:email,:username, :password)
    end

end