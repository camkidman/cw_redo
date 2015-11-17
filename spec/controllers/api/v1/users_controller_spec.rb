require 'rails_helper'

describe Api::V1::UsersController do
  before(:each) { request.headers['Accept'] = "application/vnd.calendarworkouts.v1" }

  describe "GET #dashboard" do
    before(:each) do
      @user = FactoryGirl.create :user
      @personal_detail = FactoryGirl.create(:personal_detail, user_id: @user.id)
      @goals = FactoryGirl.create(:goal, user_id: @user.id)
      get :dashboard, user_id: @user.id, format: :json
    end

      let(:dashboard_response)  { JSON.parse(response.body, symbolize_names: true) }
    it "returns the information about a reporter on a hash" do
      expect(dashboard_response[:user][:email]).to eql @user.email
    end

    it "returns a 200 response code" do
      expect(response.status).to eq(200)
    end

    it "includes a user's personal details" do
      expect(dashboard_response[:personal_details]).to respond_to(:size)
      expect(dashboard_response[:personal_details].first[:user_id]).to eq(@user.id)
    end

    it "includes a user's goals" do
      expect(dashboard_response[:goals]).to respond_to(:size)
      expect(dashboard_response[:goals].first[:user_id]).to eq(@user.id)
    end
  end
end
