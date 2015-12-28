class ScheduleSerializer < ActiveModel::Serializer
  has_many :workout_windows
end
