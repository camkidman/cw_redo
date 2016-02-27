require 'rails_helper'

describe ::Api::V1::PersonalDetailsController do
  before(:each) { request.headers['Accept'] = "application/vnd.calendarworkouts.v1" }

  describe "POST #create" do
    context "when parameters are OK" do
      before(:each) do
        @user = FactoryGirl.create(:user)
        @personal_detail_attributes = FactoryGirl.attributes_for(:personal_detail)
        post :create, { personal_detail: @personal_detail_attributes, user_id: @user.id }, format: :json
      end

      it "should create a personal_detail" do
        personal_detail_response = JSON.parse(response.body, symbolize_names: true)
        expect(personal_detail_response[:personal_detail][:weight]).to eq(@personal_detail_attributes[:weight])
        expect(response.status).to eq(201)
      end
    end

#    context "when parameters are bad" do
#      before(:each) do
#        @user = FactoryGirl.create(:user)
#        @personal_detail_attributes = { pers_detail: { name: "asdf" } }
#        post :create, { personal_detail: @personal_detail_attributes, user_id: @user.id }, format: :json
#      end
#
#      it "should return a 422 with an errors hash" do
#        personal_detail_response = JSON.parse(response.body, symbolize_names: true)
#        expect(personal_detail_response).to have_key(:errors)
#        expect(response.status).to eq(422)
#      end
#    end
    #    TODO: Fix these when I have validations
  end
end
