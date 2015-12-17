class ::Api::V1::WorkoutsController < ::Api::V1::ApiController
  def show
    @workout = Workout.includes(:exercises).find(params[:id])
    render json: @workout, status: 200
  end

  ####
  # Example request
  # { "user_id":1,
  #   "workout": {
  #     "exercises": [
  #       "id":1,
  #       "name":"pushups",
  #       "youtube_url":"https://www.youtube.com/asdf",
  #       "proper_form_text":"This is how you do a pushup",
  #       "cardio":false,
  #       "requires_gym":false
  #     ]}
  # }
  #
  #
  #
  #

  def update
    @workout = Workout.find(params[:id])
  #  @exercises =
  end

private

  def workout_params
    params.require(:workout).permit(:user_id, exercises_attributes: [:id, :name, :youtube_url, :proper_form_text, :cardio, :requires_gym])

  end
end
