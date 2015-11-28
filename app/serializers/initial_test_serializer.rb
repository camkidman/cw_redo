class InitialTestSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :complete
  has_many :workouts
end
