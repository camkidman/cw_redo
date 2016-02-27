class Workout < ActiveRecord::Base
  belongs_to :user
  belongs_to :initial_test
  has_many :exercise_details

#  after_update :generate_additional_workouts

  accepts_nested_attributes_for :exercise_details

  def mark_complete_if_so!
    return unless exercise_details.all? { |ed| ed.exercise_complete? }
    self.update_attribute :complete, true
  end

private
  def generate_additional_workouts
    if initial_test_id.present? && complete?
      ::WorkoutGeneration::WorkoutGenerator.generate_workouts(initial_test)
    end
  end
end
