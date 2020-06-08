class SessionsController < ApplicationController
    def new
    end

     def fb_create 
        @user = User.find_or_create_by(uid: auth['info']['uid']) do |u|
            u.uid = auth['info']['uid']
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = auth['info']['password']
            u.save 
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        end
     end

     def github_create 
        
        @user = User.find_or_create_by(uid: auth['info']['uid']) do |u|
            raise request.env["omniauth.auth"].inspect
            u.uid = auth['info']['uid']
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = auth['info']['password']
            u.save
            session[:user_id] = @user.id 
            #@user = User.find_or_create_by(username: auth['info']['username'])
            #@user.password = 'SecureRandom.hex'
            #@user.save 
            
            redirect_to user_path(@user)
        end 
     end


     def create
        @user = User.find_or_create_by(username: params[:user][:username])
            if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user) #login_path
            else 
                render :new
            end
     end

       

     def destroy
            reset_session 
            #session.delete :user_id 
            redirect_to '/'  #login_path
     end

     private 

     def auth 
            request.env['omniauth.auth']
     end

     end 