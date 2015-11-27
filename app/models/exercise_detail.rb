class ExerciseDetail < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :user
  belongs_to :initial_test
  belongs_to :workout

end
