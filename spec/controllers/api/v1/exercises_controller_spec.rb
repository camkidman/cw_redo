require 'rails_helper'

describe Api::V1::ExercisesController do
  describe "POST #create" do
    context "with valid attributes" do
      before(:each) do
        @exercise_attributes = FactoryGirl.attributes_for(:exercise)
        post :create, { exercise: @exercise_attributes }, format: :json
      end

      it "should return the created exercise" do
        exercise_response = JSON.parse(response.body, symbolize_names: true)
        expect(exercise_response[:name]).to eq(@exercise_attributes[:name])
      end

      it "should respond with 201" do
        expect(response.status).to eq(201)
      end
    end
  end

  describe "GET #show" do
    before(:each) do
      @exercise = FactoryGirl.create(:exercise)
      get :show, id: @exercise.id , format: :json
    end

    it "should respond with 200" do
      expect(response.status).to eq(200)
    end

    it "should contain the exercise searched for" do
      exercise_response = JSON.parse(response.body, symbolize_names: true)
      expect(exercise_response[:name]).to eq(@exercise.name)
    end
  end
end
