class ApplicationController < ActionController::Base
    helper_method :current_user
#def current_user
    #session[:user_id]
#end




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

def u_info
    @user = User.find_or_create_by(uid: auth['info']['uid']) do |u|
    u.uid = auth['info']['uid']
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = auth['info']['password']
        end
        @user.save 
            session[:user_id] = @user.id 
end
 

end 
