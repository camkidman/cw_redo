class ::Api::V1::WorkoutsController < ::Api::V1::ApiController
  def show
    @workout = Workout.includes(:exercises).find(params[:id])
    render json: @workout, status: 200
  end

  def update
    @workout = Workout.find(params[:id])
    @exercises =
  end

private

  def workout_params
    params.require(:workout).permit(:user_id, exercises_attributes: [:id, :name, :youtube_url, :proper_form_text, :cardio, :requires_gym])

  end
end
