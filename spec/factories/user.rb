FactoryGirl.define do
  factory :user do
    name { FFaker::Name }
    email { FFaker::Internet.email }
  end
end
