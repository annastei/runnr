class FormWorkoutsController < ApplicationController

  def new
    @form_workout = FormWorkout.new
  end

  def create
    @form_workout = FormWorkout.new(form_workout_params)

    if @form_workout.valid?
      @workout = Workout.from_form @form_workout

      respond_to do |format|
        #@workout.valid?
        if @workout.save
          format.html { redirect_to @workout, notice: 'Workout was successfully created.' }
          format.json { render json: @workout.attributes.merge(time_period: @workout.time_period.to_s) }
        else
          format.html { render action: 'new' }
          format.json { render json: @workout.errors.full_messages, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { render action: 'new' }
        format.json { render json: @form_workout.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  private

    def form_workout_params
      params.require(:form_workout).permit(:date, :distance, :comment, :time_period)
    end

end
