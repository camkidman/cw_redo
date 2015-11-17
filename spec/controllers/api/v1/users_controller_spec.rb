require 'rails_helper'

describe Api::V1::UsersController do
  before(:each) { request.headers['Accept'] = "application/vnd.calendarworkouts.v1" }

  describe "GET #dashboard" do
    before(:each) do
      @user = FactoryGirl.create :user
      @personal_detail = FactoryGirl.create(:personal_detail, user_id: @user.id)
      get :dashboard, user_id: @user.id, format: :json
    end

    it "returns the information about a reporter on a hash" do
      dashboard_response = JSON.parse(response.body, symbolize_names: true)
      expect(dashboard_response[:user][:email]).to eql @user.email
      expect(dashboard_response[:personal_details]).to respond_to(:size)
      expect(dashboard_response[:personal_details].first[:user_id]).to eq(@user.id)
      expect(response.status).to eql(200)
    end

  end
end
