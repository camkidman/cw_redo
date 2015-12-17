class Workout < ActiveRecord::Base
  belongs_to :user
  belongs_to :initial_test
  has_many :exercises
  has_many :exercise_details, through: :exercises

end
