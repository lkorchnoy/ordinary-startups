class UsersController < ApplicationController
skip_before_action :require_login, only: [:new, :create]
skip_before_action :find_user, only: [:index, :new, :create]     
def index
    @users = User.all 
end

def home 
    if session[:user_id]
        @user = User.find(session[:user_id])
    end

def new
    @user = User.new 
end

def show 
    
end

def create 
    @user = User.new(user_params)
    if @user.save 
        redirect_to @user 
    else 
        redirect_to login_path
    end
end

def edit
end

def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    if @user.save 
        redirect_to @user 
    else
        render :edit
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
