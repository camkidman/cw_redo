class ::Api::V1::UsersController < ::Api::V1::ApiController
  respond_to :json
  def create

  end

  def dashboard
    respond_with User.find(params[:user_id])
  end
end
