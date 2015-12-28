require 'rails_helper'
require 'goal'

describe ::Api::V1::GoalsController do
  before(:each) { request.headers['Accept'] = "application/vnd.calendarworkouts.v1" }

    describe "GET #index" do
      context "with a valid user ID" do
        before(:each) do
          @user = FactoryGirl.create(:user)
          get :index, { user_id: @user.id }, format: :json
        end

        let(:goal_response) { JSON.parse(response.body, symbolize_names: true) }

        it "should return a 200 response code" do
          expect(response.status).to eq(200)
        end

        it "should display all of a user's goals" do
          expect(goal_response[:goals].size).to eq(::Goal::DEFAULT_GOAL_HASH.size)
        end
      end
    end

    describe "PATCH #update" do
      context "with valid attributes" do
        before(:each) do
          @user = FactoryGirl.create(:user)
          goal_ids = [@user.goals.first.id]
          patch :update, { user_id: @user.id, goals: goal_ids }, format: :json
        end

        it "should return a 204 response code" do
          expect(response.status).to eq(204)
        end

        it "should update goals to be active" do
          expect(@user.goals.first.active).to be_truthy
        end

        it "should not update the other goals" do
          expect(@user.goals.last.active).to be_falsey
        end
      end
    end

end
