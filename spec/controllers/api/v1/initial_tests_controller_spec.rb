require 'rails_helper'

describe Api::V1::InitialTestsController do
  describe "GET #show" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @initial_test = FactoryGirl.create(:initial_test)
      get :show, { user_id: @user.id, id: @initial_test.id }, format: :json
    end

    let(:initial_test_response) { JSON.parse(response.body, symbolize_names: true) }

    it "should return a 200 response code" do
      expect(response.status).to eq(200)
    end

    it "should return the initial test" do
      expect(initial_test_response)
    end
  end
end
