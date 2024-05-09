class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
      @exercise_records = current_user.exercise_records.includes(:exercise)

  end
end
