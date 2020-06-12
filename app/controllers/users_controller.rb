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
    flash[:notice] = "User deleted."
    redirect_to users_path
end

private
def user_params
    params.require(:user).permit(:name, :email, :password)
end


end
