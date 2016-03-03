class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name

  has_many :personal_details
  has_many :workouts
  has_many :goals
end
