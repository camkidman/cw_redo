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

    it "should return the workout" do
      expect(initial_test_response[:workout]).to_not be_nil
    end

    it "should return 4 exercises" do
      expect(initial_test_response[:initial_test_exercises].size).to eq(4)
    end

    it "should return 4 exercise details" do
      expect(initial_test_response[:initial_test_exercise_details].size).to eq(4)
    end
  end

  describe "PATCH/PUT #update" do
    context "with exercise details" do
      before(:each) do
        @user = FactoryGirl.create(:user)
        @exercise_detail = @user.initial_test.exercise_details.first
        @exercise_detail.reps = 20
        @exercise_detail.sets = 3
        patch :update, { user_id: @user.id, exercise_detail_attributes: @exercise_detail.to_json }, format: :json
      end

      let(:initial_test_response) { JSON.parse(response.body, symbolize_names: true) }

      it "should return a 201" do
        expect(response.status).to eq(201)
      end

      it "should update the exercise detail" do
        expect(initial_test_response)
      end

    end
  end
end
