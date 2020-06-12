class ApplicationController < ActionController::Base
    helper_method :current_user
#def current_user
    #session[:user_id]
#end

def logged_in?
    !!current_user 
end 


def require_login 
    unless logged_in?
        redirect_to '/'
    end
end

def current_user  
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

def set_category 
    @category = Category.find_by(id: params[:category_id])
end
 

end 
