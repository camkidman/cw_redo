FactoryGirl.define do
  factory :workout_window do
    schedule
    start_time 4.hours.from_now
    end_time 5.hours.from_now
  end

end
