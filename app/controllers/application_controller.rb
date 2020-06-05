class ApplicationController < ActionController::Base

def current_user
    session[:user_id]
end

def logged_in?
    !!current_user 
end 


def require_login 
    unless logged_in?
        redirect_to '/'
    end
end

#def current_user  
    #@current_user ||= User.find(session[:user_id]) if session[:user_id]
#end

end 
