class ExerciseDetailSerializer < ActiveModel::Serializer
  attributes :id, :time, :reps, :weight, :sets

  has_one :exercise
end
