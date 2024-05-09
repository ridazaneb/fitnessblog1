
class GoalsController < ApplicationController
 
  def new
    @goal = Goal.new
  end
  def create
  @goal = Goal.new(goal_params)
  if @goal.save
    redirect_to goals_path, notice: "Goal was successfully created."
  else
    render :new
  end
end

   private

  def goal_params
    params.require(:goal).permit(:name, :description)
  end

end
