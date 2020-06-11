class StartupsController < ApplicationController

def new
    if params[:category_id] && !Category.exists?(params[:category_id])
        redirect_to categories_path, alert: "Category not found."
    else 
    @startup = Startup.new(category_id: params[:artist_id])
    end  
end

def index 
    if params[:category_id]
        @category = Category.find_by(id: params[:category_id])
        if @category.nil?
            redirect_to categories_path, alert: "Category not found"
        else
        @startups = @category.startups 
        end 
    else  
        @songs = Song.all 
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
