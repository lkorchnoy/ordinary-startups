class StartupsController < ApplicationController
  
def new
    if params[:category_id] && !Category.exists?(params[:category_id])
        redirect_to categories_path, alert: "Category not found."
    else 
    @startup = Startup.new(category_id: params[:category_id])
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
        @startups = Startup.all
        render :index   
    end
end

def show 
    if params[:category_id]
        @category = Category.find_by(id: params[:category_id])
        @startup = @category.startups.find_by(id: params[:id])
        if @startup.nil? 
            redirect_to category_startup_path(@category), alert: "Startup not found"
        end
    else 
    @startup = Startup.find_by(id: params[:id])
        end
end 

def create
    @startup = Startup.new(startup_params)
    if @startup.save
    redirect_to @startup
else   
    render :new 
    end
end 

def edit
    if params[:category_id]
        @category = Category.find_by(id: params[:category_id])
        if @category.nil?
            redirect_to categories_path, alert: "Category not found"
        else  
    @startup = @category.startups.find_by(id: params[:id])
    redirect_to category_startup_path(@category), alert: "Startup not found." if @startup.nil?
        end
    else  
        @startup = Startup.find_by(id: params[:id])
    end
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

def destroy 
    @startup = Startup.find_by(id: params[:id])
    @startup.destroy 
    redirect_to startups_path 
end 


private 
def startup_params
    params.require(:startup).permit(:company, :innovation, :product, :location, categories_attributes: [:name, :category_id])
end
end
