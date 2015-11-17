class User < ActiveRecord::Base
  has_one :initial_test
  has_many :workouts
  has_many :exercises, through: :exercise_details
  has_many :exercise_details
  has_many :goals
  has_one :schedule
  has_many :personal_details
end
