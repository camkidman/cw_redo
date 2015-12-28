class Api::V1::SchedulesController < Api::V1::ApiController
  def update
    @schedule = Schedule.find(params[:schedule][:id])
    if @schedule.update_attributes(schedule_params)
      render :json => @schedule, status: 204, location: api_user_dashboard_path(@schedule.user)
    else
      render :json => { errors: @schedule.errors }, status: 422
    end
  end

private

  def schedule_params
    params.require(:schedule).permit(:id, :workout_windows_attributes => [:id, :start_time, :end_time])
  end
end
