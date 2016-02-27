FactoryGirl.define do
  factory :workout do
    user

    factory :workout_with_exercise_details do
      transient do
        exercise_details_count 3
      end

      after(:create) do |workout, evaluator|
        create_list(:exercise_detail, evaluator.exercise_details_count, workout: workout)
      end
    end
  end
end
