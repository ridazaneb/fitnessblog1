class PlansController < ApplicationController
 def index
    if current_user
      @plans = current_user.plans
    else
      @plans = [] # Set @plans to an empty array if there is no logged-in user
    end
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
    params.require(:plan).permit(:title, :description) 
  end
end
