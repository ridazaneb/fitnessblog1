# app/controllers/goals_controller.rb

class GoalsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    if current_user
      @goals = current_user.goals
    else
      @potential_goals = PotentialGoal.all
    end
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.build(goal_params)
    if @goal.save
      redirect_to goals_path, notice: "Goal was successfully created."
    else
      render :new
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :description, :start_date, :end_date)
  end
end
