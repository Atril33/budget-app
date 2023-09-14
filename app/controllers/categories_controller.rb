class CategoriesController < ApplicationController
    def index
      @categories = Category.all
    end

    def show
      @category = Category.find(params[:id])
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      @category.user = current_user
    
      if @category.save 
        flash[:notice] = 'Category is Created'
        redirect_to categories_path
      else
        flash[:alert] = 'Category is not Created'
        render :new
      end
    end
    
    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      redirect_to categories_path, notice: 'Category deleted successfully'
    end
    
    def category_params
      params.require(:category).permit(:name, :icon).merge(user: current_user)
    end
  end