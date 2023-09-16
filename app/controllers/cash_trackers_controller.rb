class CashTrackersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def new
    @select_option = Category.all
    @category = Category.find(params[:category_id])
    @cash_tracker = CashTracker.new
  end

  def create
    @cash_tracker = CashTracker.create(cash_tracker_params)
    @cash_tracker.categories << @category
    if @cash_tracker.save
      redirect_to category_path(@category), notice: 'CashTracker was successfully created.'
    else
      render :new
    end
  end


  private

  def cash_tracker_params
    @category = Category.find(params[:category_id])
    params.require(:cash_tracker).permit(:name, :amount, :categories_id).merge(user_id: current_user.id)
  end
end
