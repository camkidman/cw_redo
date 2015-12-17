require 'rails_helper'

describe Api::V1::WorkoutsController do
  describe "GET #show" do
    context "when a workout is found" do
      before(:each) do
        @workout = FactoryGirl.create(:workout_with_exercises)
        get :show, { user_id: @workout.user.id, id: @workout.id }, format: :json
      end

      let(:workout_response) { JSON.parse(response.body, symbolize_names: true) }

      it "should return a 200 response code" do
        expect(response.status).to eq(200)
      end

      it "should return the workout" do
        expect(workout_response[:workout]).to be_present
      end

      it "should return exercises" do
        expect(workout_response[:workout][:exercises].size).to eq(3)
      end
    end
  end

  describe "PATCH #update" do
    context "with exercises that have valid attributes"
  end
end

