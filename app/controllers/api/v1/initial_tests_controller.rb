class ::Api::V1::InitialTestsController < ::Api::V1::ApiController
  respond_to :json

  def show
    @initial_test = InitialTest.includes(:workouts, :exercises).find_by(user_id: params[:user_id])
    render json: @initial_test, status: 200
  end
end
