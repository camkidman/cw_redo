FactoryGirl.define do
  factory :schedule do
    user

    factory :schedule_with_windows do
      transient do
        window_count 2
      end

      after(:create) do |schedule, evaluator|
        create_list(:workout_window, evaluator.window_count, schedule: schedule)
      end
    end
  end

end
