require 'rails_helper'

describe Api::V1::WorkoutsController do
  describe "GET #show" do
    context "when a workout is found" do
      before(:each) do
        @workout = FactoryGirl.create(:workout)
        binding.pry
        get :show, { user_id: @workout.user.id, id: @workout.id }, format: :json
      end

      it "should return a 200 response code" do
        expect(response.status).to eq(200)
      end

      it "should return the workout and exercises" do
        # gotta get exercises to be returned here
      end
    end
  end
end

