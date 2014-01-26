class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  def count
    @count = Workout.count
    respond_to do |format|
      format.json { render json: @count }
    end
  end

  def average_speed
    @average_speed = Workout.average_speed
    respond_to do |format|
      format.json { render json: @average_speed}
    end
  end

  def average_per_week
    @average_per_week = Workout.average_per_week
    respond_to do |format|
      format.json { render json: @average_per_week}
    end
  end

  def statistics
    @count = Workout.count
    @average_speed = Workout.average_speed
    @average_per_week = Workout.average_per_week
    respond_to do |format|
      format.json { render json: {count: @count, average_speed: @average_speed, average_per_week: @average_per_week}}
    end

  end

  # GET /workouts
  # GET /workouts.json
  def index
    @workouts = Workout.all
  end

  # GET /workouts/1
  # GET /workouts/1.json
  def show
  end

  # GET /workouts/new
  def new
    @workout = Workout.new
  end

  # GET /workouts/1/edit
  def edit
  end

  # POST /workouts
  # POST /workouts.json
  def create
    @workout = Workout.new(workout_params)

    respond_to do |format|
      if @workout.save
        format.html { redirect_to @workout, notice: 'Workout was successfully created.' }
        format.json { render json: @workout.attributes.merge(time_period: @workout.time_period.to_s) }
      else
        format.html { render action: 'new' }
        format.json { render json: @workout.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workouts/1
  # PATCH/PUT /workouts/1.json
  def update
    respond_to do |format|
      if @workout.update(workout_params)
        format.html { redirect_to @workout, notice: 'Workout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    @workout.destroy
    respond_to do |format|
      format.html { redirect_to workouts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workout_params
      params.require(:workout).permit(:date, :distance, :duration, :comment, :time_period)
    end
end
