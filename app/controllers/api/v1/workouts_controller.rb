class ::Api::V1::WorkoutsController < ::Api::V1::ApiController
  def show
    @workout = Workout.includes(:exercises).find(params[:id])
    render json: @workout, status: 200
  end
end
