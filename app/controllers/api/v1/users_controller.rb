class ::Api::V1::UsersController < ::Api::V1::ApiController
  respond_to :json
  def create

  end

  def dashboard
    @user = User.includes(:personal_details, :goals).find(params[:user_id])
    render json: { :user => @user, :personal_details => @user.personal_details, :goals => @user.goals }
  end

  def upload_progress_picture

  end
end
