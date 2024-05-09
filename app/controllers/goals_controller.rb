class GoalsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    if current_user
      @goals = current_user.goals
    else
      @potential_goals = PotentialGoal.all
    end
  end

end
