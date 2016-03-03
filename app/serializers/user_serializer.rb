class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :workouts

  has_many :personal_details
  has_many :workouts, include: :exercise_detail
  has_many :goals
end
