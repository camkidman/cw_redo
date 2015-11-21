class ::Api::V1::ExerciseDetailsController < ::Api::V1::ApiController
  respond_to :json

  def index
    render json: ExerciseDetail.where(:user_id => params[:user_id]), status: 200
  end

  def create
    @exercise_detail = ExerciseDetail.new(exercise_detail_params)
    if @exercise_detail.save
      render json: @exercise_detail, status: 201, location: api_user_exercise_detail_path(:user, @exercise_detail)
    else
      render json: @exercise_detail.errors, status: 422
    end
  end

  def show
    render json: ExerciseDetail.find(params[:id]), resposne: 200
  end

private

  def exercise_detail_params
    params.require(:exercise_detail).permit(:exercise_id, :user_id, :initial_test_id, :workout_id, :time, :reps, :sets, :weight)
  end
end
