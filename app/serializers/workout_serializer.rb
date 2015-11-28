class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :user_id
  has_many :exercises
end
