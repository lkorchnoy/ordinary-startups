class SessionsController < ApplicationController
    before_action :u_info, only:[:fb_create, :github_create]
    def new
    end

     def fb_create 
        redirect_to user_path(@user)
        end

     def github_create 
        redirect_to startups_path 
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