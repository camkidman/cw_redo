FactoryGirl.define do
  factory :workout do
    user
  end

#  factory :workout_with_exercises do
#    transient do
#      exercises_count 3
#    end
#
#    after(:create) do |user, evaluator|
#      create_list(:exercise, evaluator.exercises_count, workout: workout)
#    end
#  end
  factory :workout_with_exercises, :parent => :workout do |workout|
    exercises { build_list :exercise, 3 }
  end

end
