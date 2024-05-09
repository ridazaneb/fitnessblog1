class PlansController < ApplicationController
  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to root_path, notice: 'Plan was successfully created.'
    else
      render :new
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :description) # Add more fields as needed
  end
end
