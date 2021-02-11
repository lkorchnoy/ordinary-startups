class StartupsController < ApplicationController
    before_action :require_login
def new
    if params[:category_id] && !Category.exists?(params[:category_id])
        redirect_to new_category_startup_path        #redirect_to categories_path
    else 
    @startup = Startup.new(category_id: params[:category_id])
    end  
end

def index 
    if params[:category_id]
        @category = Category.find_by(id: params[:category_id])
        if @category.nil?
            redirect_to category_startups_path, alert: "Category not found"
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
    @startup.user = current_user
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
    @startup.user = current_user 
    if @startup.update(startup_params)
        redirect_to category_startup_path(@startup.category, @startup)  
    else
        render :edit
    end
end

def destroy 
    @startup = Startup.find_by(id: params[:id])
    @startup.destroy 
    redirect_to startups_path 
end 


