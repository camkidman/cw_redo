require 'rails_helper'

describe ::Api::V1::SchedulesController do
  before(:each) { request.headers['Accept'] = "application/vnd.calendarworkouts.v1" }

  describe "PATCH #update" do
    context "with valid workout windows" do
      before(:each) do
        @schedule = FactoryGirl.create(:schedule_with_windows)
        workout_windows = @schedule.workout_windows.map { |ww| ww.attributes }
        workout_windows.first["end_time"] = 14.hours.from_now
        schedule_hash = { :id => @schedule.id, :workout_windows_attributes => workout_windows }
        patch :update, { user_id: @schedule.user_id, schedule: schedule_hash }, format: :json
      end

      let(:schedule_response) { JSON.parse(response.body, symbolize_names: true) }

      it "should return a 204 response code" do
        expect(response.status).to eq(204)
      end

      it "should update the workout windows passed in" do
        expect(Time.parse(schedule_response[:schedule][:workout_windows].first[:end_time]).to_i).to be_within(1.second).of 14.hours.from_now.to_i
      end
    end

    context "when adding a new workout window" do
      it "should accept a new window" do
        @schedule = FactoryGirl.create(:schedule_with_windows)
        workout_windows = @schedule.workout_windows.map { |ww| ww.attributes }
        workout_windows << { :start_time => 16.hours.from_now, :end_time => 17.hours.from_now }
        schedule_hash = { :id => @schedule.id, :workout_windows_attributes => workout_windows }
        patch :update, { user_id: @schedule.user_id, schedule: schedule_hash }, format: :json
        expect(JSON.parse(response.body, symbolize_names: true)[:schedule][:workout_windows].size).to eq(3)
      end
    end
  end

end
