class CategoriesController < ApplicationController
    def index
        if session[:user_id].present?
        @categories = Category.all
    else  
        redirect_to root_path 
    end

    def new
        @category = Category.new 
        @category.startups.build
    end
    
    def show
        if session[:user_id].present?
            @category = Category.find_by(id: params[:id])
            else  
                redirect_to root_path 
        end
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to @startup
        else 
            render :new
        end
    end

    def edit
        @category = Category.find_by(id: params[:id])
    end

    def update
           @category = Category.find_by(id: params[:id])
           @category.update(category_params)
        if @category.save 
           redirect_to @startup  
        else
        render :edit
        end
    end

    
    private 
    def category_params
        params.require(:category).permit(:name,
        startups_attributes: [
            :company,
            :innovation,
            :product,
            :location,
            :category_id,
            :user_id
        ]
    )
    end

end
