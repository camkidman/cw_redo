require 'rails_helper'

RSpec.describe User, type: :model do
  it "should have an initial test after creation" do
    user = FactoryGirl.create(:user)
    expect(user.initial_test).to_not be_nil
  end


end
