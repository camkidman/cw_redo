include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :user do
    name { FFaker::Name }
    email { FFaker::Internet.email }
    progress_picture { fixture_file_upload("#{Rails.root}/app/assets/images/default_progress_picture.png", 'image/png') }
  end
end
