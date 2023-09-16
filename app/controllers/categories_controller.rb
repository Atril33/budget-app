class CategoriesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  def index
    @categories = Category.all
    authorize! :read, Category # Authorize the ability to read Category
  end
  
      def show
        @category = Category.find(params[:id])
        @cash_tracker = @category.cash_trackers
        @total_amount = @category.cash_trackers.sum(&:amount)
      end
      

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
    
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
      params.require(:category).permit(:name, :icon).merge(user_id: current_user.id)
    end
  end