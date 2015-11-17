class Workout < ActiveRecord::Base
  belongs_to :user
  belongs_to :initial_test
end
