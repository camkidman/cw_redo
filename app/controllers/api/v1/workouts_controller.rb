class ::Api::V1::WorkoutsController < ::Api::V1::ApiController
  def show
    @workout = Workout.includes(:exercise_details).find(params[:id])
    render json: @workout, status: 200
  end

  ####
  # Example request
  # { "user_id":1,
  #   "workout": {
  #     "exercise_details": [
  #       "id":1,
  #       "exercise_id":3,
  #       "time":65 # should be in seconds,
  #       "sets":3,
  #       "reps":15,
  #       "weight":50
  #     ]
  #     }
  # }
  #
  #
  #
  #

  def update
    @workout = Workout.find(params[:id])
    if @workout.update_attributes(workout_params)
      @workout.mark_complete_if_so!
      render :json => @workout, :status => 200
    else
      render :json => { errors: @workout.errors }, :status => 422
    end
  end

private

  def workout_params
    params.require(:workout).permit(:id, :user_id, exercise_details_attributes: [:id, :time, :reps, :sets, :weight])
  end
end
