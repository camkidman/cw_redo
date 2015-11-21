FactoryGirl.define do
  factory :exercise_detail do
    exercise
    user
    initial_test nil
    workout nil
    time 100
    reps 12
    sets 2
    weight 180
  end

end
