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
    context "with exercise details that have valid attributes" do
      before(:each) do
        @workout = FactoryGirl.create(:workout_with_exercises)
        @workout.exercise_details.first.reps = 1000
        workout_attributes = @workout.attributes
        workout_attributes["exercise_details_attributes"] = @workout.exercise_details.map { |ed| ed.attributes }
        workout_attributes["exercise_details_attributes"].first["reps"] = 1000
        patch :update, { user_id: @workout.user.id, id: @workout.id, workout: workout_attributes }, format: :json
      end

      let(:workout_response) { JSON.parse(response.body, symbolize_names: true) }

      it "should return a 200 status code" do
        expect(response.status).to eq(200)
      end

      it "should update the exercise_detail" do
        expect(workout_response[:workout][:exercise_details].first[:reps]).to eq(1000)
      end
    end
  end
end

