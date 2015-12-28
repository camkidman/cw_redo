class Goal < ActiveRecord::Base
  belongs_to :user

  DEFAULT_GOAL_HASH = [
    { :text => "Get stronger", :cardio_based => false },
    { :text => "Lose baby weight", :cardio_based => true },
    { :text => "Get started", :cardio_based => false },
    { :text => "Get faster", :cardio_based => true },
    { :text => "Slim down", :cardio_based => true },
    { :text => "Tone up", :cardio_based => true },
    { :text => "Bulk up", :cardio_based => false }
  ]
end
