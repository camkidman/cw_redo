class ::Api::V1::ExercisesController < ::Api::V1::ApiController
  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      render json: @exercise, status: 201, location: [:api, @exercise]
    else
      render json: @exercise.errors, status: 422
    end
  end

  def show
    render json: Exercise.find(params[:id]), status: 200
  end

private

  def exercise_params
    params.require(:exercise).permit(:name, :youtube_url, :proper_form_text, :cardio, :requires_gym)
  end
end
