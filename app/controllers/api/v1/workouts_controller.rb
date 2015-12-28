class ::Api::V1::WorkoutsController < ::Api::V1::ApiController
  def show
    @workout = Workout.includes(:exercises).find(params[:id])
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
  #     ],
  #     "exercise": {
  #       "name":"pushups",
  #       "youtube_url":"https://www.youtube.com",
  #       "proper_form_text":"This is how you do a pushup",
  #       "cardio":false,
  #       "requires_gym":false
  #     }
  #     }
  # }
  #
  #
  #
  #

  def update
    @workout = Workout.find(params[:id])
    if @workout.update_attributes(workout_params)
      render :json => @workout, :status => 200
    else
      render :json => { errors: @workout.errors }, :status => 422
    end
  end

private

  def workout_params
    params.require(:workout).permit(:id, :user_id, exercises_attributes: [:id, :name, :youtube_url, :proper_form_text, :cardio, :requires_gym], exercise_details_attributes: [:id, :time, :reps, :sets, :weight])
  end
end
