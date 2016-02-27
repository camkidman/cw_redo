include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :user do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    progress_picture { fixture_file_upload("#{Rails.root}/app/assets/images/default_progress_picture.png", 'image/png') }
    after(:build) { |u| u.password_confirmation = u.password = "asdf123!" }
  end
end
