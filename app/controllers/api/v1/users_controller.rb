class ::Api::V1::UsersController < ::Api::V1::ApiController
  respond_to :json
  def create

  end

  def dashboard
    @user = User.find(params[:user_id])
    @personal_details = @user.personal_details
    render json: { :user => @user, :personal_details => @personal_details }
  end
end
