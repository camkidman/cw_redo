class Api::V1::GoalsController < Api::V1::ApiController
  def index
    @user = User.find(params[:user_id])
    render :json => @user.goals, status: 200
  end

  def update
    @user = User.find(params[:user_id])
    begin
      params[:goals].map { |goal_id| Goal.find(goal_id).update_attribute :active, true }
      render :json => @user, status: 204, location: api_user_dashboard_path(@user)
    rescue
      render :json => { errors: @user.goals.errors }, status: 422
    end
  end

private

  def goal_params
    params.require(:goals).permit(:id)
  end
end
