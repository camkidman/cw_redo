class ::Api::V1::InitialTestsController < ::Api::V1::ApiController
  respond_to :json

  def show
    @initial_test = InitialTest.includes(:workout, :exercises, :exercise_details).find_by(user_id: params[:user_id])
    render json: { :initial_test => @initial_test, :initial_test_exercises => @initial_test.exercises, :initial_test_exercise_details => @initial_test.exercise_details, :workout => @initial_test.workout }, status: 200
  end

#  def update
#    @initial_test = InitialTest.includes(:workout, :exercises, :exercise_details).find_by(user_id: params[:user_id])
#    if @initial_test.update_attributes(initial_test_params)
#    render json: { :initial_test => @initial_test, :initial_test_exercises => @initial_test.exercises, :initial_test_exercise_details => @initial_test.exercise_details, :workout => @initial_test.workout }, status: 201, location: api_user_initial_test_path(:user, @initial_test)
#    else
#      render json: @initial_test.errors, status: 422
#    end
#  end
#
#private
#
#  def initial_test_params
#    params.require(:initial_test).permit()
#  end
end
