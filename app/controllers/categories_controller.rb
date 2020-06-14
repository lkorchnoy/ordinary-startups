class CategoriesController < ApplicationController
    def index
        if current_user && params[:search]
            @categories = Category.search(params[:search])

        elsif session[:user_id]
        @categories = Category.all
        
    else  
        redirect_to root_path 
       end
    end

    def new
        @category = Category.new 
    end
    
    def show
        if current_user  
            @category = Category.find_by(id: params[:id])
            else  
                redirect_to root_path 
        end
    end

    def create
            @category = Category.new(category_params)
        if @category.save
            redirect_to @category 
        else 
            render :new
        end
    end

    
    private 
    def category_params
        params.require(:category).permit(:name)
    end

end

