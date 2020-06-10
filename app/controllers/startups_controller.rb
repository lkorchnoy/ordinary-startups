class StartupsController < ApplicationController

def index 
    if session[:user_id].present?
        @startups = Startup.all 
    else  
        redirect_to root_path 
    end
    
end

def show 
    if session[:user_id].present?
    @startup = Startup.find_by(id: params[:id])
    
    else  
        redirect_to root_path 
    end
end 

def create
    @startup = Startup.new(startup_params)
    if @startup.save
    redirect_to @startup
else   
    @startups = Startup.all 
    render :index 
    end
end 

def edit
    @startup = Startup.find_by(id: params[:id])
end

def update 
    @startup = Startup.find_by(id: params[:id])
    @startup.update(startup_params)
    if @startup.save 
        redirect_to @startup  
    else
        render :edit
    end
end


private 
def startup_params
    params.require(:startup).permit(:company, :innovation, :product, :location)
end


end
