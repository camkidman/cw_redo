class Api::V1::PersonalDetailsController < Api::V1::ApiController
  respond_to :json

  ##
  # /users/:user_id/personal_detail
  #
  # Accepted params and format:
  #
  # { "user_id":1,
  #   "personal_detail": {
  #     "gender":
  #     "weight":
  #     "neck":
  #     "shoulders":
  #     "chest":
  #     "bicep":
  #     "waist":
  #     "hips":
  #     "thigh":
  #     "resting_heart_rate":
  #     "calf":
  #     "date":
  #   }
  # }
  #
  # response location will be the user dashboard

  def create
    @user= User.find(params[:user_id])
    @personal_detail = @user.personal_details.build(personal_detail_params)
    if @personal_detail.save
      render json: @personal_detail, status: 201, location: api_user_dashboard_path(@personal_detail.user.id)
    else
      render json: { errors: @personal_detail.errors }, status: 422
    end
  end

  private

  def personal_detail_params
    params.require(:personal_detail).permit(:gender, :weight, :neck, :shoulders, :chest, :bicep, :waist, :hips, :thigh, :resting_heart_rate, :calf, :date, :user_id)
  end
end
