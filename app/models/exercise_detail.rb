class ExerciseDetail < ActiveRecord::Base
  belongs_to :user
  belongs_to :initial_test
  belongs_to :workout
  has_many :exercises
  has_many :workouts, :through => :exercises

  def exercise_complete?
    (reps.present? && sets.present?) || time.present?
  end
end
