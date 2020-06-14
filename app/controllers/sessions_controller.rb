class SessionsController < ApplicationController
    def new
    end

     def fb_create 
        @user = User.find_or_create_by(uid: auth['info']['uid']) do |u|
            u.uid = auth['info']['uid']
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = auth['info']['password']
            
        end
        @user.save 
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        end

     def github_create 
        @user = User.find_or_create_by(uid: auth['info']['uid']) do |u|
            
            u.uid = auth['info']['uid']
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = auth['info']['password']
            
        end
        @user.save 
            session[:user_id] = @user.id 
            redirect_to startups_path #user_path(@user)
    end


     def create
        @user = User.find_or_create_by(email: params[:sessions][:email])
            
        if @user && @user.authenticate(params[:sessions][:password])
            session[:user_id] = @user.id 
            redirect_to startups_path 
            else 
                render :new
            end
     end

    def destroy
            session.delete :user_id 
            redirect_to login_path
     end

     private 
     def auth 
           request.env['omniauth.auth']
     end

     end 