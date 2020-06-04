class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = auth['info']['password']
        end

        session[:user_id] = @user.id 
        redirect_to login_path 
    end

    def destroy
        session.delete :user.id 
        redirect_to login_path 
    end

    private 
    def auth 
        request.env['omniauth.auth']
    end
end