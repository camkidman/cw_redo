require 'rails_helper'

describe Api::V1::ExerciseDetailsController do
  describe "POST #create" do
    context "with valid params" do
      before(:each) do
        @ed_params = FactoryGirl.attributes_for(:exercise_detail)
        @user = FactoryGirl.create(:user)
        post :create, { user_id: @user.id, exercise_detail: @ed_params }, format: :json
      end

      let(:exercise_response) { JSON.parse(response.body, symbolize_names: true) }

      it "should return a 201 response code" do
        expect(response.status).to eq(201)
      end

      it "should return the created exercise_detail" do
        expect(exercise_response[:weight]).to eq(@ed_params[:weight])
      end
    end
  end

  describe "GET #index" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @exercise_details = 2.times { @user.exercise_details << FactoryGirl.create(:exercise_detail) }
      get :index, user_id: @user.id, format: :json
    end

    let (:exercise_details_response) { JSON.parse(response.body, symbolize_names: true) }

    it "should return a 200 response code" do
      expect(response.status).to eq(200)
    end

    it "should return a list of exercise_details for a user" do
      expect(exercise_details_response[:exercise_details]).to respond_to(:size)
      expect(exercise_details_response[:exercise_details].size).to eq(2)
    end

  end

  describe "GET #show" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @exercise_detail = FactoryGirl.create(:exercise_detail)
      get :show, { user_id: @user.id, id: @exercise_detail.id }, format: :json
    end

    let(:exercise_details_response) { JSON.parse(response.body, symbolize_names: true) }

    it "should return a 200 response code" do
      expect(response.status).to eq(200)
    end

    it "should return an exercise_detail" do
      expect(exercise_details_response[:weight]).to eq(@exercise_detail.weight)
    end

  end
end
