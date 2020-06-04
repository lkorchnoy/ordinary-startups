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
    @category = Category.new 
end 

def create
    @startup = Startup.new(startup_params)
    if @startup.save
    redirect_to startup_url(@startup)
else   
    @startups = Startup.all 
    render :index 
    end
end 

private 
def startup_params
    params.require(:startup).permit(:company, :innovation, :product, :location)
end


end
