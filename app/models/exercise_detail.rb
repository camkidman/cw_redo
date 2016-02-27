class ExerciseDetail < ActiveRecord::Base
  belongs_to :user
  belongs_to :initial_test
  belongs_to :workout
  belongs_to :exercise

  def exercise_complete?
    (reps.present? && sets.present?) || time.present?
  end
end
