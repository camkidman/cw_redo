require 'rails_helper'

describe Api::V1::InitialTestsController do
  describe "GET #show" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @initial_test = @user.initial_test
      get :show, { user_id: @user.id, id: @initial_test.id }, format: :json
    end

    let(:initial_test_response) { JSON.parse(response.body, symbolize_names: true) }

    it "should return a 200 response code" do
      expect(response.status).to eq(200)
    end

    it "should return the initial test" do
      expect(initial_test_response[:initial_test][:id]).to eq(@initial_test.id)
    end

    it "should return workouts" do
      expect(initial_test_response[:initial_test][:workouts]).to_not be_nil
    end

    it "should return 4 exercise details" do
      expect(initial_test_response[:initial_test][:workouts].first[:exercise_details].size).to eq(4)
    end
  end
end
