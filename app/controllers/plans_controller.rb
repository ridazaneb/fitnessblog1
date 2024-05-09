class PlansController < ApplicationController
  def index
  @plans = Plan.all
end
  
  def new
    @plan = Plan.new
  end

  def create
    @plan = current_user.plans.build(plan_params)

    if @plan.save
      redirect_to plans_path, notice: 'Plan was successfully created.'
    else
      render :new
    end
  end

  def set_plan
    @plan = Plan.find(params[:id])
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :description) # Add more fields as needed
  end
end
