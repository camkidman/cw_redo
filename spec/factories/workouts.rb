FactoryGirl.define do
  factory :workout do
    user

    factory :workout_with_exercises do
      transient do
        exercises_count 3
      end

      after(:create) do |workout, evaluator|
        create_list(:exercise, evaluator.exercises_count, workout: workout)
      end
    end
  end
end
