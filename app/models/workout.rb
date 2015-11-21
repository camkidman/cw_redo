class Workout < ActiveRecord::Base
  belongs_to :user
  belongs_to :initial_test
  has_many :exercises, through: :exercise_details
  has_many :exercise_details
end
