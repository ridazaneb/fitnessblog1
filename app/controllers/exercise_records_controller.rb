class ExerciseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @exercise_record = ExerciseRecord.new
  end

  def create
    @exercise_record = current_user.exercise_records.build(exercise_record_params)

    if @exercise_record.save
      redirect_to exercises_path, notice: 'Exercise record was successfully created.'
    else
      render :new
    end
  end

  private

  def exercise_record_params
    params.require(:exercise_record).permit(:exercise_id, :time, :speed, :calories)
  end
end
