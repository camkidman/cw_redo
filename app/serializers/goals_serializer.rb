class GoalSerializer < ActiveModel::Serializer
  attributes :id, :text, :active

  belongs_to :user_id
end
