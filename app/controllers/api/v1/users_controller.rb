class ::Api::V1::UsersController < ::Api::V1::ApiController
  respond_to :json
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 201, location: [:api, @user, :dashboard]
    else
      render json: @user.errors, status: 422
    end
  end

  def dashboard
    @user = User.includes(:personal_details, :goals).find(params[:user_id])
    render json: { :user => @user, :personal_details => @user.personal_details, :goals => @user.goals }
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      render json: @user, status: 200, location: [:api, @user, :dashboard]
    else
      render json: @user.errors, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :email, :progress_picture)
  end
end
