class UsersController < ApplicationController
before_action :require_login, except: [:new, :create, :home]

   
def index
    @users = User.all 
end

def home 
end

def new
    @user = User.new 
end

def show 
    if params[:user_id]
        
        @user = User.find_by(id: params[:id])
        
        if @startup.nil?  
            redirect_to new_user_startup_path
        else 
            @startup = @user.startups.find_by(id: params[:id])
        redirect_to user_startups_path(@user)
       #@current_user.startups = User.find_by(id: params[:id]).current_user.startups 
        end
    else    
    @startup = Startup.find_by(id: params[:id])
    end
end


def create 
    @user = User.new(user_params)
    if @user.save 
        session[:user_id] = @user.id 
        redirect_to @user #root_path 
    else 
        render 'users/new' 
    end
end

def destroy 
    @user = User.find_by(id: params[:id])
    @user.destroy 
    session.clear
    flash[:notice] = "User deleted."
    redirect_to users_path
end

private
def user_params
    params.require(:user).permit(:name, :email, :password, :startup_id)
end


end
