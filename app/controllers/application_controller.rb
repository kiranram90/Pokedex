class ApplicationController < ActionController::Base

helper_method :current_user, :logged_in? #gives access to methods in the views
 


private
def current_user
 @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id] #the if portion protects to not make calls to the database if it doesn't need to make call to DB.
end

def logged_in?
 !!session[:user_id]
end

def redirect_if_not_logged_in
  redirect_to '/' if !logged_in?
end

end