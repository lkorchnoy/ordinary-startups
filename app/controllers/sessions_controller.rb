class SessionsController < ApplicationController
    def new
    end

    def fb_create 
        @user = User.find_or_create_by(uid: auth['info']['uid']) do |u
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = auth['info']['password']
            u.save 
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        end

        def github_create 
            @user = User.find_or_create_by(username: auth['info']['email'])
            #@user.password = 'Password.hex'
            @user.save 
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        end


    def create
        |@user = User.find_or_create_by(username: params[:user][:username])
            if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
            else 
                render :new
            end
            
        end

        session[:user_id] = @user.id 
        redirect_to login_path 
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