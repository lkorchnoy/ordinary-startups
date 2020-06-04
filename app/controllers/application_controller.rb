class ApplicationController < ActionController::Base
before_action :require_login 
before_action :find_user







private 
def require_login 
    unless logged_in?
        redirect_to new_login_url 
    end
end

def find_user 
    @user = User.find_by(id: params[:id])
end
