class CashTrackersController < ApplicationController
  def index
   @category = Category.find(params[:category_id])
   @cash_trackers = @category.cash_trackers
  end
  
  def new
    @category = Category.find(params[:category_id])
    @cash_tracker = CashTracker.new
  end

  def create
    @cash_tracker = CashTracker.create(cash_tracker_params)
  if @cash_tracker.save
    redirect_to category_cash_trackers_path(@category), notice: 'CashTracker was successfully created.'
  else
    render :new
  end
end


  private

  private

  def cash_tracker_params
    @category = Category.find(params[:category_id])
    params.require(:cash_tracker).permit(:name, :amount).merge(user_id: current_user.id, categories_id: @category.id)
  end
  
end
