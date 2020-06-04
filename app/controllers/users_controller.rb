class UsersController < ApplicationController
skip_before_action :require_login, only: [:new, :create]
skip_before_action :find_user, only: [:index, :new, :create]     
def index
    @users = User.all 
end

def new
    @user = User.new 
end

def show 
    
end

def create 
end

def edit
end

def update
end

def destroy 
end







end
