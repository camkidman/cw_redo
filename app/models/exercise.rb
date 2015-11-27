class Exercise < ActiveRecord::Base
  has_many :muscle_groups
  has_many :body_parts, through: :muscle_groups
  has_many :workouts, through: :exercise_details
  belongs_to :workout
  belongs_to :exercise_details

  accepts_nested_attributes_for :exercise_details
end
