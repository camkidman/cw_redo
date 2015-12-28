class Schedule < ActiveRecord::Base
  belongs_to :user
  has_many :workout_windows

  accepts_nested_attributes_for :workout_windows
end
