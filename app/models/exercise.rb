class Exercise < ActiveRecord::Base
  has_many :muscle_groups
  has_many :body_parts, through: :muscle_groups
  has_many :workouts, through: :exercise_details
  has_many :exercise_details
end
