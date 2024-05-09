
class GoalsController < ApplicationController
  def index
    if current_user
      @goals = current_user.goals
      @potential_goals = []
    else
      @goals = []
      @potential_goals = [
        { name: "Lose Weight", description: "Achieve weight loss through diet and exercise." },
        { name: "Build Muscle", description: "Increase muscle mass and strength through resistance training." },
        { name: "Improve Endurance", description: "Enhance cardiovascular fitness and stamina." }
        # Add more potential goals as needed
      ]
    end
  end
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
