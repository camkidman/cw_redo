require 'rails_helper'

describe Api::V1::UsersController do
  before(:each) { request.headers['Accept'] = "application/vnd.calendarworkouts.v1" }

  describe "GET #dashboard" do
    before(:each) do
      @user = FactoryGirl.create :user
      get :dashboard, user_id: @user.id, format: :json
    end

    it "returns the information about a reporter on a hash" do
      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response[:email]).to eql @user.email
      expect(response.status).to eql(200)
    end

  end
end
