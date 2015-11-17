class Api::V1::PersonalDetailsController < Api::V1::ApiController
  def show

  end

  def create
    if @personal_detail = PersonalDetail.create(personal_detail_params)
      render json: @personal_detail, status: 201, location: api_user_personal_detail_path(:user, @personal_detail)
    else
      render json: { errors: @personal_detail.errors }, status: 422
    end
  end

  private

  def personal_detail_params
    params.require(:personal_detail).permit(:gender, :weight, :neck, :shoulders, :chest, :bicep, :waiste, :hips, :thigh, :resting_heart_rate, :calf, :date, :user_id)
  end
end
