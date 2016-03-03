class ::Api::V1::InitialTestsController < ::Api::V1::ApiController
  respond_to :json

  def show
    @initial_test = InitialTest.includes(:workouts).find_by(user_id: params[:user_id])
    binding.pry
    render json: @initial_test, include: "workouts.exercise_details.exercises", status: 200
  end
end
