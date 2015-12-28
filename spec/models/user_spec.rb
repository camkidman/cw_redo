require 'rails_helper'

RSpec.describe User, type: :model do
  it "should have an initial test after creation" do
    user = FactoryGirl.create(:user)
    expect(user.initial_test).to_not be_nil
  end

  it "should have a set of goals after creation" do
    user = FactoryGirl.create(:user)
    expect(user.goals.size).to eq(::Goal::DEFAULT_GOAL_HASH.size)
  end


end
