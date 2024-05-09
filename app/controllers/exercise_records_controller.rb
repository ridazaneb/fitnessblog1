class ExerciseRecordsController < ApplicationController
  before_action :set_exercise_record, only: %i[ show edit update destroy ]

  # GET /exercise_records or /exercise_records.json
  def index
    @exercise_records = ExerciseRecord.all
  end

  # GET /exercise_records/1 or /exercise_records/1.json
  def show
  end

  # GET /exercise_records/new
  def new
    @exercise_record = ExerciseRecord.new
  end

  # GET /exercise_records/1/edit
  def edit
  end

  # POST /exercise_records or /exercise_records.json
  def create
    @exercise_record = ExerciseRecord.new(exercise_record_params)

    respond_to do |format|
      if @exercise_record.save
        format.html { redirect_to exercise_record_url(@exercise_record), notice: "Exercise record was successfully created." }
        format.json { render :show, status: :created, location: @exercise_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exercise_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercise_records/1 or /exercise_records/1.json
  def update
    respond_to do |format|
      if @exercise_record.update(exercise_record_params)
        format.html { redirect_to exercise_record_url(@exercise_record), notice: "Exercise record was successfully updated." }
        format.json { render :show, status: :ok, location: @exercise_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exercise_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercise_records/1 or /exercise_records/1.json
  def destroy
    @exercise_record.destroy!

    respond_to do |format|
      format.html { redirect_to exercise_records_url, notice: "Exercise record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise_record
      @exercise_record = ExerciseRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exercise_record_params
      params.require(:exercise_record).permit(:exercise_id, :time, :speed, :calories)
    end
end
