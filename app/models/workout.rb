class Workout < ActiveRecord::Base
  belongs_to :user
  belongs_to :initial_test
  has_many :exercises
  has_many :exercise_details, through: :exercises

  accepts_nested_attributes_for :exercise_details

  def mark_complete_if_so!
    return unless exercise_details.all? { |ed| (ed.reps.present? && ed.sets.present?) || ed.time.present? }
    update_attribute :complete, true
  end
end
